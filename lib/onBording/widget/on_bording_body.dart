import 'package:flutter/material.dart';
import 'package:flutter_application_3/auth/login/login_screen.dart';
import 'package:flutter_application_3/core/utils/app_colors.dart';
import 'package:flutter_application_3/core/utils/size_config.dart';
import 'package:flutter_application_3/core/widget/custom_widget_botton.dart';
import 'package:flutter_application_3/onBording/widget/coustom_dots_Indicator.dart';
import 'package:flutter_application_3/onBording/widget/coustom_page_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class OnBordingBody extends StatefulWidget {
  const OnBordingBody({super.key});

  @override
  State<OnBordingBody> createState() => _OnBordingBodyState();
}

class _OnBordingBodyState extends State<OnBordingBody> {
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    // تأكد من تهيئة SizeConfig قبل الاستخدام
    SizeConfig().init(context);

    return Stack(
      children: [
        CoustomPageView(
          pageController: pageController,
        ),
        // الثلاث نقاط في الصفحة
        Positioned(
          left: 0,
          right: 0,
          bottom: SizeConfig.defaultSize * 20,
          child: CoustomDotsIndicator(
            dontIndex: (pageController?.hasClients ?? false)
                ? pageController!.page ?? 0
                : 0,
          ),
        ),
        Visibility(
          visible: (pageController?.hasClients ?? false) &&
              (pageController?.page?.round() == 2 ? false : true),
          child: Positioned(
            top: MediaQuery.of(context).size.height * .1,
            right: 32,
            child: GestureDetector(
              onTap: () {
                pageController?.jumpToPage(2);
              },
              child: Text(
                "Skip",
                style: TextStyle(fontSize: 16, color: AppColors.textColor),
              ),
            ),
          ),
        ),
        Positioned(
          left: (SizeConfig.defaultSize) * 10,
          right: (SizeConfig.defaultSize) * 10,
          bottom: (SizeConfig.defaultSize) * 10,
          child: CustomGeneralButton(
            onTap: () {
              if (pageController!.page! < 2) {
                pageController?.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else {
                Get.to(() => LoginScreen(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 500));
              }
            },
            text: (pageController?.hasClients ?? false) &&
                    (pageController?.page?.round() == 2)
                ? "Get Started"
                : "Next",
          ),
        ),
      ],
    );
  }
}
