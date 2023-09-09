import 'package:flutter/material.dart';
import '../core/color_manager.dart';

class RoleWidgwt extends StatelessWidget {
  const RoleWidgwt({
    super.key,
    required this.title,
    required this.icon,
    this.isSelected = false,
    required this.onPressed,
  });
  final String title;
  final String icon;
  final bool isSelected;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 90,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: isSelected
                  ? ColorsManager.backGroundColor
                  : Colors.transparent,
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
