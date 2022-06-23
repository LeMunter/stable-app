import 'package:flutter/material.dart';
import 'package:stable/theme.dart';
import 'package:stable/widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    Key? key, required this.onchanged,
  }) : super(key: key);

  final ValueChanged onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onchanged,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: "Password",
            icon: Icon(
              Icons.lock,
              color: AppColors.textLight,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: AppColors.textLight,
            ),
            border: InputBorder.none
        ),
      ),
    );
  }
}