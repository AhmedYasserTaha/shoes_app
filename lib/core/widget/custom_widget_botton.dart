import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/utils/app_colors.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width *
            .8, // عرض الزر يكون 80% من الشاشة
        decoration: BoxDecoration(
          color: AppColors.pColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    required this.text,
    required this.onTap,
    required this.iconData,
    required this.color,
  });

  final String text;
  final VoidCallback onTap;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width *
            0.8, // عرض الزر يكون 80% من الشاشة
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 2,
            color: const Color(0xff707070),
          ),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // توسيط العناصر داخل الزر
          children: [
            Icon(
              iconData,
              size: 30, // حجم الأيقونة
              color: color,
            ),
            const SizedBox(width: 12), // مسافة بين الأيقونة والنص
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
