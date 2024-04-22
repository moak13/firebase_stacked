import 'package:firebase_stacked/app/app.locator.dart';
import 'package:firebase_stacked/app/app.logger.dart';
import 'package:firebase_stacked/app/app.router.dart';
import 'package:firebase_stacked/exception/firebase_stacked_exception.dart';
import 'package:firebase_stacked/services/user_service.dart';
import 'package:firebase_stacked/ui/views/signin/signin_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class SigninViewModel extends FormViewModel {
  final _logger = getLogger('SigninViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final _userService = locator<UserService>();

  Future<void> submit() async {
    try {
      final result = await runBusyFuture(
        _firebaseAuthenticationService.loginWithEmail(
          email: emailValue ?? '',
          password: passwordValue ?? '',
        ),
        throwException: true,
      );

      if (result.hasError && result.user == null) {
        _logger.w('Authentication Failed');
        _dialogService.showDialog(
          title: 'Error',
          description: result.errorMessage,
        );
        return;
      }

      if (!result.hasError && result.user == null) {
        _logger.wtf(
            'We have no error but the user is null. This should not be happening');
        _dialogService.showDialog(
          title: 'Opps',
          description: 'Unknown Error',
        );
        return;
      }

      final user = await _userService.fetchUser(uid: result.user?.uid);
      _navigationService.clearStackAndShow(Routes.homeView);
    } on FirebaseStackedException catch (e) {
      _logger.e(e.toString());
      _dialogService.showDialog(
        title: 'Error',
        description: e.message,
      );
    } catch (e) {
      _logger.e(e.toString());
      _dialogService.showDialog(
        title: 'Opps',
        description: 'Unknown Error',
      );
    }
  }

  void moveToSignUp() {
    _navigationService.navigateToSignupView();
  }
}
