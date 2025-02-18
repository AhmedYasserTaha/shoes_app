import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/utils/app_colors.dart';

class CoustomDotsIndicator extends StatelessWidget {
  const CoustomDotsIndicator({super.key, required this.dontIndex});
  final double? dontIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: dontIndex!,
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        // color: Colors.transparent,
        activeColor: AppColors.pColor,
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: AppColors.pColor)),
      ),
    );
  }
}
