import 'package:clario_test_task/components/signup_form.dart';
import 'package:clario_test_task/components/custom_scaffold.dart';
import 'package:clario_test_task/theme/theme.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 138),
            // Sign Up Title
            Center(
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: appColors.onPrimary,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Form
            const SignUpForm(),
          ],
        ),
      ),
    );
  }
}
