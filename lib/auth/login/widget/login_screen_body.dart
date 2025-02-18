import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/register/register_screen.dart';
import 'package:flutter_application_3/core/utils/app_colors.dart';
import 'package:flutter_application_3/core/widget/custom_text_form_filed.dart';
import 'package:flutter_application_3/core/widget/custom_widget_botton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';


class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final _formKey = GlobalKey<FormState>(); // مفتاح النموذج للتحقق من الإدخال
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscured = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey, // ربط الفورم بالمفتاح
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(MediaQuery.of(context).size.height * .2),

                CustomTextFormField(
                  controller: emailController,
                  text: "Your Email",
                  label: "Your Email",
                  inputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                        .hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  suffexIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.pColor,
                  ),
                ),
                Gap(MediaQuery.of(context).size.height * .03),

                CustomTextFormField(
                  controller: passwordController,
                  text: "Password",
                  label: "Password",
                  obscureText: isObscured,
                  inputType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                  suffexIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                    icon: Icon(
                      isObscured ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.pColor,
                    ),
                  ),
                ),
                Gap(MediaQuery.of(context).size.height * .10),

                Center(
                    child: CustomGeneralButton(
                        text: "Login",
                        onTap: _login)), // استدعاء دالة التحقق عند الضغط

                Gap(MediaQuery.of(context).size.height * .03),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(RegisterScreen());
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Register",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.pColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(MediaQuery.of(context).size.height * .05),

                Center(
                    child: Text(
                  "or login with",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
                Gap(MediaQuery.of(context).size.height * .02),

                Row(
                  children: [
                    Expanded(
                      child: CustomButtonWithIcon(
                        text: "Facebook",
                        onTap: () {},
                        iconData: FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomButtonWithIcon(
                        text: "Google",
                        onTap: () {
                          // signInWithGoogle();
                        },
                        iconData: FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
