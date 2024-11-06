import 'package:clario_test_task/theme/theme.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final Function(bool) onError;

  const EmailField({
    super.key,
    required this.onError,
  });

  @override
  State<EmailField> createState() => EmailFieldState();
}

class EmailFieldState extends State<EmailField> {
  final FocusNode focusNode = FocusNode();

  bool isValid = false;
  final regex =
      RegExp(r'^(?!.*\.\.)[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  Color enabledBorderColor = appColors.secondary;
  Color fillColor = appColors.primaryContainer;
  Color valueColor = appColors.onPrimary;
  Color hintColor = appColors.onSecondary;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(focusHandler);
  }

  focusHandler() {
    setState(() {
      hintColor =
          focusNode.hasFocus ? appColors.primary : appColors.onSecondary;
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      obscureText: false,
      style: TextStyle(color: valueColor, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: fillColor,
        enabledBorder: outlineInputBorder(enabledBorderColor),
        focusedBorder: outlineInputBorder(appColors.onSecondary),
        focusedErrorBorder: outlineInputBorder(appColors.onSecondary),
        errorBorder: outlineInputBorder(appColors.onError),
        hintStyle: TextStyle(color: hintColor),
        hintText: 'Email',
      ),
      validator: (value) {
        if (value == null) return 'Error';
        isValid = value.contains(regex);
        setState(() {
          enabledBorderColor = isValid ? appColors.tertiary : appColors.onError;
          fillColor = isValid ? appColors.primaryContainer : appColors.error;
          valueColor = isValid ? appColors.tertiary : appColors.onError;
        });
        widget.onError(isValid);

        return null;
      },
    );
  }

  OutlineInputBorder outlineInputBorder(borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
