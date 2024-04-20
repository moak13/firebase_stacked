import 'package:firebase_stacked/app/app.locator.dart';
import 'package:firebase_stacked/app/app.logger.dart';
import 'package:firebase_stacked/data_models/user_data_model.dart';
import 'package:firebase_stacked/exception/firebase_stacked_exception.dart';
import 'package:firebase_stacked/services/firestore_service.dart';

class UserService {
  final _logger = getLogger('UserService');
  final _firestoreService = locator<FirestoreService>();

  Future<void> createUser({UserDataModel? user}) async {
    try {
      await _firestoreService.post(
        path: 'users/${user?.id}',
        data: user!.toJson(),
      );
    } catch (e) {
      _logger.e('error trying to create a user', e);
      throw FirebaseStackedException(
        message: 'Failed to create user data',
        devDetails: e.toString(),
      );
    }
  }

  Future<UserDataModel?> fetchUser({String? uid}) async {
    try {
      final response = await _firestoreService.get<UserDataModel?>(
        path: 'users/$uid',
        builder: (json) => UserDataModel.fromJson(json),
      );

      return response;
    } catch (e) {
      _logger.e('error trying to fetch a user', e);
      throw FirebaseStackedException(
        message: 'Failed to fetch user data',
        devDetails: e.toString(),
      );
    }
  }

  Future<void> updateUser({UserDataModel? user}) async {
    try {
      await _firestoreService.patch(
        path: 'users/${user?.id}',
        data: user!.toJson(),
      );
    } catch (e) {
      _logger.e('error trying to update a user', e);
      throw FirebaseStackedException(
        message: 'Failed to update user data',
        devDetails: e.toString(),
      );
    }
  }

  Future<void> deleteUser({String? uid}) async {
    try {
      await _firestoreService.delete(
        path: 'users/$uid',
      );
    } catch (e) {
      _logger.e('error trying to delete a user', e);
      throw FirebaseStackedException(
        message: 'Failed to delete user data',
        devDetails: e.toString(),
      );
    }
  }
}
