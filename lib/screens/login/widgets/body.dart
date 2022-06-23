import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stable/theme.dart';
import 'package:stable/widgets/rounded_button.dart';
import 'package:stable/widgets/rounded_input_field.dart';
import 'package:stable/screens/login/text.dart';
import 'background.dart';
import 'package:stable/widgets/rounded_password_field.dart';
import 'package:stable/widgets/account_check.dart';
import 'package:stable/screens/screens.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.03,),
        RoundedInputField(
          onChanged: (String value) {  },
          hintText: textHint,
        ),
        RoundedPasswordField(onchanged: (value) {  },
        ),
        RoundedButton(
          text: buttonText,
          press: () => login(context),
          color: AppColors.secondary,
          textColor: AppColors.textLight,
        ),
        SizedBox(height: size.height * 0.03,),
        AccountCheck(press: () => accountCheck(context),)
      ],
    ),);
  }
}


void accountCheck(BuildContext context) {
  if (kDebugMode) {
    print('data: "accountCheck"');
  }

  Navigator.push(context, MaterialPageRoute(builder: (context){return const SignUpScreen();},),);
}

void login(BuildContext context) {
  if (kDebugMode) {
    print('data: "login"');
  }

  Navigator.push(context, MaterialPageRoute(builder: (context){return HomeScreen();},),);
}



