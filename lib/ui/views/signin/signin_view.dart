import 'package:firebase_stacked/ui/common/ui_helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signin_view.form.dart';
import 'signin_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class SigninView extends StackedView<SigninViewModel> with $SigninView {
  const SigninView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SigninViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          children: [
            const Text('Firebase Stacked'),
            verticalSpaceTiny,
            const Text('A place where things are as they are'),
            verticalSpaceLarge,
            TextFormField(
              controller: emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'kindly enter your email',
                labelText: 'Email Address',
              ),
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  passwordFocusNode.requestFocus();
                }
              },
            ),
            verticalSpaceSmall,
            TextFormField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                hintText: 'kindly enter your password',
                labelText: 'Password',
              ),
            ),
            verticalSpaceMedium,
            MaterialButton(
              color: Colors.black,
              onPressed: viewModel.submit,
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            verticalSpaceMassive,
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account?',
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                    text: 'Sign up.',
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        viewModel.moveToSignUp();
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(SigninViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(SigninViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  SigninViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SigninViewModel();
}
