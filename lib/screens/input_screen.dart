import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:madkour_task/core/strings_manager.dart';
import 'package:madkour_task/widgets/custom_button.dart';
import '../widgets/role_widget.dart';
import '../widgets/text_form_field.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Image.asset(
                  'assets/madkour-utilities2.png',
                  width: kIsWeb ? 400 : 160,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: const Offset(0, 15))
                    ]),
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      AppString.selectUser,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RoleWidgwt(
                          onPressed: () {},
                          title: AppString.agent,
                          icon: 'assets/businessman.png',
                        ),
                        RoleWidgwt(
                          onPressed: () {},
                          title: AppString.manamger,
                          icon: 'assets/database-management.png',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFromField(
                      controller: emailController,
                      lablel: AppString.email,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFromField(
                      controller: emailController,
                      lablel: AppString.password,
                    ),
                    CustomButton(
                      text: AppString.login,
                      onPressed: () {},
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                        ),
                        Text(
                          '  Or  ',
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            height: 4,
                          ),
                        ),
                      ],
                    ),
                    CustomButton(
                      text: AppString.containueAsAdmin,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
