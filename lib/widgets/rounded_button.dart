import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.text,
    Key? key, required this.press, required this.color, required this.textColor,
  }) : super(key: key);

  final String text;
  final Function() press;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: size.width * 0.7,
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(29),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: color,
                onPrimary: textColor
            ),
            onPressed: press,
            child: Text(text),
          ),
        ),
      ),
    );
  }
}