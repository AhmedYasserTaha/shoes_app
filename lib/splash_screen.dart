import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/utils/app_colors.dart';
import 'package:flutter_application_3/onBording/on_bording_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadingAnimation;
// هنا عملنا الانميشن بتاع النص
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController);
    animationController.repeat(reverse: true);

    Future.delayed(const Duration(seconds: 4), () {
      Get.off(() => OnBordingScreen()); // ينقل للصفحة بدون زر الرجوع
    });
  }

// هنا استخدمنا  dispose عشان الانميشن ميفضلش شغال على الفاضي
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textSize = size.width * 0.12; // حجم النص يكون 12% من عرض الشاشة

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/running-shoes.jpg",
              fit: BoxFit.cover, // عشان تملأ العرض بالكامل
            ),
          ),
          Expanded(
            // ده بيخلي النص في منتصف الشاشة بالضبط
            child: Center(
              child: AnimatedBuilder(
                animation: fadingAnimation,
                builder: (context, child) => Opacity(
                  opacity: fadingAnimation.value,
                  child: Text(
                    "Running Shoes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: textSize,
                      // fontFamily: "Poppins",
                      // color: const Color.fromARGB(255, 0, 0, 0),
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
          )
        ],
      ),
    );
  }
}
