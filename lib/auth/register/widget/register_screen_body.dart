import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/login/login_screen.dart';
import 'package:flutter_application_3/core/utils/app_colors.dart';
import 'package:flutter_application_3/core/widget/custom_text_form_filed.dart';
import 'package:flutter_application_3/core/widget/custom_widget_botton.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';


class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final _formKey = GlobalKey<FormState>(); // مفتاح النموذج للتحقق من الإدخال
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isObscured = true;

  void _register() {
    if (_formKey.currentState!.validate()) {
      // لو البيانات صحيحة، نفذ التسجيل
      print("Name: ${nameController.text}");
      print("Email: ${emailController.text}");
      print("Password: ${passwordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey, // ربط الفورم بالمفتاح
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(MediaQuery.of(context).size.height * .05),

                CustomTextFormField(
                  controller: nameController,
                  text: "Your Name",
                  label: "Your Name",
                  inputType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  suffexIcon: Icon(
                    Icons.person_2_outlined,
                    color: AppColors.pColor,
                  ),
                ),
                Gap(MediaQuery.of(context).size.height * .03),

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
                Gap(MediaQuery.of(context).size.height * .03),

                CustomTextFormField(
                  controller: confirmPasswordController,
                  text: "Confirm Password",
                  label: "Confirm Password",
                  obscureText: isObscured,
                  inputType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password";
                    } else if (value != passwordController.text) {
                      return "Passwords do not match";
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
                Gap(MediaQuery.of(context).size.height * .1),

                Center(
                    child: CustomGeneralButton(
                        text: "Register", onTap: _register)),
                // استدعاء دالة التحقق عند الضغط
                Gap(MediaQuery.of(context).size.height * .05),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(LoginScreen());
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "You have an account? ",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Login",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
