import 'package:flutter/material.dart';
import '../core/app_raduis.dart';
import '../core/color_manager.dart';

class RoleWidgwt extends StatelessWidget {
  const RoleWidgwt({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.transparent,
    required this.onPressed,
  });
  final String title;
  final String icon;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            onPressed();
          },
          child: Container(
            width: 90,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: AppRaduis.borderAll12,
              color: color,
              border: Border.all(
                color: ColorsManager.mainColor,
              ),
            ),
            child: Center(
              child: Image.asset(
                icon,
                height: 40,
                color: ColorsManager.mainColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
