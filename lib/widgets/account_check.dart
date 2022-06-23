import 'package:flutter/material.dart';

class AccountCheck extends StatelessWidget {
  const AccountCheck({
    Key? key, this.login = true, required this.press,
  }) : super(key: key);

  final bool login;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don´t have an Account ? " : "Already have an Account ? "
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}