import 'package:firebase_stacked/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signup_view.form.dart';
import 'signup_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(name: 'first_name'),
    FormTextField(name: 'last_name'),
    FormTextField(name: 'email'),
    FormTextField(name: 'password'),
  ],
)
class SignupView extends StackedView<SignupViewModel> with $SignupView {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
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
              controller: firstNameController,
              focusNode: firstNameFocusNode,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'kindly enter your first name',
                labelText: 'First Name',
              ),
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  lastNameFocusNode.requestFocus();
                }
              },
            ),
            verticalSpaceSmall,
            TextFormField(
              controller: lastNameController,
              focusNode: lastNameFocusNode,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'kindly enter your last name',
                labelText: 'Last Name',
              ),
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  emailFocusNode.requestFocus();
                }
              },
            ),
            verticalSpaceSmall,
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
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(SignupViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    super.onViewModelReady(viewModel);
  }

  @override
  void onDispose(SignupViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
