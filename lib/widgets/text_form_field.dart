import 'package:flutter/material.dart';
import 'package:madkour_task/core/color_manager.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField(
      {super.key, required this.controller, required this.lablel});
  final TextEditingController controller;
  final String lablel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        //Hides label on focus or if filled
        filled: true,
        // Needed for adding a fill color
        fillColor: Colors.white,
        isDense: true,
        label: Text(lablel),
        // Reduces height a bit
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: ColorsManager.mainColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: ColorsManager.mainColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        errorStyle: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
