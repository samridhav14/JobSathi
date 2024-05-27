import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_sathi/constants/app_constants.dart';
import 'package:job_sathi/controllers/exports.dart';
import 'package:job_sathi/models/request/auth/signup_model.dart';
import 'package:job_sathi/views/common/app_bar.dart';
import 'package:job_sathi/views/common/app_style.dart';
import 'package:job_sathi/views/common/custom_btn.dart';
import 'package:job_sathi/views/common/custom_textfield.dart';
import 'package:job_sathi/views/common/height_spacer.dart';
import 'package:job_sathi/views/common/reusable_text.dart';
import 'package:job_sathi/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginNotifier = Provider.of<LoginNotifier>(context);
    return Consumer<SignUpNotifier>(
      builder: (context, signupNotifier, child) {
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                  text: "SignUp",
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(CupertinoIcons.arrow_left),
                  )),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: signupNotifier.signupFormKey,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const HeightSpacer(size: 30),
                    ReusableText(
                        text: "Hello, Welcome!",
                        style: appstyle(30, Color(kDark.value), FontWeight.w600)),
                    ReusableText(
                        text: "Fill the details to SignUp to your account",
                        style: appstyle(
                            16, Color(kDarkGrey.value), FontWeight.w600)),
                    const HeightSpacer(size: 50),
                    CustomTextField(
                      controller: name,
                      keyboardType: TextInputType.text,
                      hintText: "Full Name",
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Please enter your Full Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const HeightSpacer(size: 20),
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
                      obscureText: signupNotifier.obscureText,
                      validator: (password) {
                        if (signupNotifier.passwordValidator(password??'') == false){
                          return "Please enter a vaild password with atleast  1 uppercase, 1 lowercase, 1 number and 1 special character ans should be 7 characters long";
                        } else {
                          return null;
                        }
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          signupNotifier
                              .toggleObscureText(!signupNotifier.obscureText);
                        },
                        child: Icon(
                          (signupNotifier.obscureText == true)
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(kDark.value),
                        ),
                      ),
                    ),
                    const HeightSpacer(size: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.offAll(() => const LoginPage());
                        },
                        child: ReusableText(
                            text: "Login",
                            style: appstyle(
                                14, Color(kDark.value), FontWeight.w500)),
                      ),
                    ),
                    const HeightSpacer(size: 50),
                    CustomButton(
                      onTap: () {
                          if(signupNotifier.validateAndSave()){
                            loginNotifier.firstTime = !loginNotifier.firstTime;
                            SignupModel model = SignupModel(
                              email: email.text.trim(),
                              password: password.text.trim(),
                              username: name.text.trim(),
                            );
                            signupNotifier.upSignUp(model);
                          }
                          else{
                            Get.snackbar("Sign up Failed", "Please Check your credentials",
                                colorText: Color(kLight.value),
                                backgroundColor: Colors.red,
                                icon: const Icon(Icons.add_alert));
                          }
                      },
                      text: "SignUp",
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
