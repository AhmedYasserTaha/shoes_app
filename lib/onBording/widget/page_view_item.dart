import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/utils/app_colors.dart';
import 'package:gap/gap.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.suptitle,
    required this.image,
  });

  final String title;
  final String suptitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: constraints.maxHeight * 0.1),
            SizedBox(
              height: constraints.maxHeight * 0.2,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            Gap(constraints.maxHeight * 0.05),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.06,
                  color: AppColors.titleColor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.02),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
              child: Text(
                suptitle,
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.04,
                  color: AppColors.supTitleColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
