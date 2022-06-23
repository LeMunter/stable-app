import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stable/theme.dart';
import 'package:stable/widgets/account_check.dart';
import 'package:stable/widgets/rounded_input_field.dart';
import 'package:stable/widgets/rounded_password_field.dart';
import 'package:stable/screens/login/login_screen.dart';
import 'background.dart';
import 'package:stable/widgets/or_divider.dart';
import 'package:stable/widgets/social_icon.dart';
import 'package:stable/screens/signup/text.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                ),
              ),
              RoundedInputField(
                hintText: textHint,
                onChanged: (emailValue) {},
              ),
              RoundedPasswordField(
                onchanged: (passwordValue) {},
              ),
              SizedBox(height: size.height * 0.03,),
              AccountCheck(
                press: () => accountCheck(context),
                login: false,
              ),
              const OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    iconSrc: "assets/icons/f_logo_RGB-Blue_58.png",
                    press: () => oAuthLogin(context, 1),
                  ),
                  SocialIcon(
                    iconSrc: "assets/icons/google.png",
                    press: () => oAuthLogin(context, 2),
                  ),
                  SocialIcon(
                    iconSrc: "assets/icons/twitter_blue.png",
                    press: () => oAuthLogin(context, 3),
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }
}


void accountCheck(BuildContext context) {
  if (kDebugMode) {
    print('data: "accountCheck"');
  }

  Navigator.push(context, MaterialPageRoute(builder: (context){return const LoginScreen();},),);
}

void oAuthLogin(BuildContext context, int app) {
  if (kDebugMode) {
    print('data: "oAuth app:" $app');
  }

}

