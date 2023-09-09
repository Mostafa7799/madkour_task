import 'package:flutter/material.dart';
import 'package:madkour_task/core/color_manager.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.controller,
    required this.label,
    this.suffix,
    this.onTap,
  });
  final TextEditingController controller;
  final String label;
  final Function? onTap;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      onTap: onTap as void Function()? ?? () {},
      validator: (value) {
        if (value!.isEmpty) {
          return 'This Field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        //Hides label on focus or if filled
        filled: true,
        // Needed for adding a fill color
        fillColor: Colors.white,
        isDense: true,
        label: Text(label),
        // Reduces height a bit
        suffixIcon: suffix,
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
