import 'package:clario_test_task/theme/theme.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final bool formSubmitted;
  final Function(bool) onError;
  const PasswordField({
    super.key,
    required this.formSubmitted,
    required this.onError,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final FocusNode focusNode = FocusNode();

  bool showPassword = false;
  bool hasMinLength = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasDigit = false;

  Color enabledBorderColor = appColors.secondary;
  Color fillColor = appColors.primaryContainer;
  Color valueColor = appColors.onPrimary;
  Color hintColor = appColors.onSecondary;

  void focusHandler() {
    setState(() {
      hintColor =
          focusNode.hasFocus ? appColors.primary : appColors.onSecondary;
    });
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(focusHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          focusNode: focusNode,
          obscureText: !showPassword ? true : false,
          style: TextStyle(color: valueColor, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            fillColor: fillColor,
            enabledBorder: outlineInputBorder(enabledBorderColor),
            focusedBorder: outlineInputBorder(appColors.onSecondary),
            focusedErrorBorder: outlineInputBorder(appColors.onSecondary),
            errorBorder: outlineInputBorder(appColors.onError),
            hintStyle: TextStyle(color: hintColor),
            hintText: 'Create your password',
            suffixIcon: IconButton(
              icon: Icon(
                !showPassword ? Icons.visibility_off : Icons.visibility,
                color: valueColor,
              ),
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
            ),
          ),
          validator: (value) {
            bool isValid = false;
            if (value != null) {
              setState(() {
                hasMinLength = value.length >= 8 && !value.contains(' ');
                hasUppercase = value.contains(RegExp(r'[A-Z]'));
                hasLowercase = value.contains(RegExp(r'[a-z]'));
                hasDigit = value.contains(RegExp(r'\d'));
                isValid =
                    hasMinLength && hasUppercase && hasLowercase && hasDigit;
                enabledBorderColor =
                    isValid ? appColors.tertiary : appColors.onError;
                fillColor =
                    isValid ? appColors.primaryContainer : appColors.error;
                valueColor = isValid ? appColors.tertiary : appColors.onError;
              });
              widget.onError(isValid);
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPasswordCriteria(
                  '8 characters or more (no spaces)',
                  hasMinLength,
                ),
                _buildPasswordCriteria(
                  'Uppercase and lowercase letters',
                  hasUppercase && hasLowercase,
                ),
                _buildPasswordCriteria(
                  'At least one digit',
                  hasDigit,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordCriteria(String text, bool isValid) {
    Color criteriaColor;

    if (!widget.formSubmitted) {
      criteriaColor =
          isValid ? const Color(0xB227B274) : const Color(0xFF4A4E71);
    } else {
      criteriaColor =
          isValid ? const Color(0xB227B274) : const Color(0xFFFF8080);
    }
    return Text(
      text,
      style: TextStyle(
        color: criteriaColor,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
