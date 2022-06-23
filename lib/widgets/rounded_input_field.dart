import 'package:flutter/material.dart';
import 'package:stable/widgets/text_field_container.dart';
import 'package:stable/theme.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key, required this.hintText, this.icon = Icons.person, required this.onChanged,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        style: const TextStyle(color: AppColors.textLight),
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon, color: AppColors.textLight,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}