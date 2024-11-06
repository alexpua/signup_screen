import 'package:clario_test_task/components/email_field.dart';
import 'package:clario_test_task/components/password_field.dart';
import 'package:clario_test_task/components/signup_button.dart';
import 'package:clario_test_task/theme/theme.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool formSubmitted = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  _validateEmail(bool isValid) {
    setState(() {
      isEmailValid = isValid;
    });
  }

  void _validatePassword(bool isValid) {
    setState(() {
      isPasswordValid = isValid;
    });
  }

  void _validateAndSubmit() {
    FocusScope.of(context).unfocus();

    setState(() {
      formSubmitted = true;
    });
    if (_formKey.currentState!.validate() && isEmailValid && isPasswordValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Sign up success',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: appColors.onPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: 315,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailField(
              onError: _validateEmail,
            ),
            const SizedBox(height: 16),
            PasswordField(
              formSubmitted: formSubmitted,
              onError: _validatePassword,
            ),
            const SizedBox(height: 40),
            SignUpButton(onPressed: _validateAndSubmit),
          ],
        ),
      ),
    );
  }
}
