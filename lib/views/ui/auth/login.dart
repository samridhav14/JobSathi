import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_sathi/constants/app_constants.dart';
import 'package:job_sathi/controllers/login_provider.dart';
import 'package:job_sathi/views/common/app_bar.dart';
import 'package:job_sathi/views/common/app_style.dart';
import 'package:job_sathi/views/common/custom_btn.dart';
import 'package:job_sathi/views/common/custom_textfield.dart';
import 'package:job_sathi/views/common/height_spacer.dart';
import 'package:job_sathi/views/common/reusable_text.dart';
import 'package:job_sathi/views/ui/auth/signup.dart';
import 'package:job_sathi/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                text: "Login",
                child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(CupertinoIcons.arrow_left),
                      )
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const HeightSpacer(size: 30),
                  ReusableText(
                      text: "Welcome Back!",
                      style:
                          appstyle(30, Color(kDark.value), FontWeight.w600)),
                  ReusableText(
                      text: "Fill the details to login to your account",
                      style: appstyle(
                          16, Color(kDarkGrey.value), FontWeight.w600)),
                  const HeightSpacer(size: 50),
                  CustomTextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email",
                    validator: (email) {
                      if (email!.isEmpty || !email.contains("@")) {
                        return "Please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const HeightSpacer(size: 20),
                  CustomTextField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    hintText: "Password",
                    obscureText: loginNotifier.obscureText,
                    validator: (password) {
                      if (password!.isEmpty || password.length < 7) {
                        return "Please enter a valid password";
                      } else {
                        return null;
                      }
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        loginNotifier.toggleObscureText(!loginNotifier.obscureText);
                      },
                      child: Icon(
                         (loginNotifier.obscureText==true)?Icons.visibility_off:Icons.visibility,
                        color: Color(kDark.value),
                      ),
                    ),
                  ),
                  const HeightSpacer(size: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const RegistrationPage());
                      },
                      child: ReusableText(
                          text: "Register",
                          style: appstyle(
                              14, Color(kDark.value), FontWeight.w500)),
                    ),
                  ),
                  const HeightSpacer(size: 50),
                  CustomButton(
                    onTap: () {
                     Get.to(()=>const MainScreen());
                    },
                    text: "Login",
                  )
                ],
              ),
            ));
      },
    );
  }
}


                  
    
