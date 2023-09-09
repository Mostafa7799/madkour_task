import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:madkour_task/core/color_manager.dart';
import 'package:madkour_task/core/strings_manager.dart';
import 'package:madkour_task/screens/admin/admin_screen.dart';
import 'package:madkour_task/screens/agent/agent_screen.dart';
import 'package:madkour_task/screens/manager/manager_screen.dart';
import 'package:madkour_task/widgets/custom_button.dart';
import 'package:page_transition/page_transition.dart';
import '../../core/app_raduis.dart';
import '../../widgets/role_widget.dart';
import '../../widgets/text_form_field.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  bool isManager = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    borderRadius: AppRaduis.borderAll12,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: const Offset(0, 15))
                    ]),
                child: Form(
                  key: _formKey,
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
                            onPressed: () {
                              setState(() {
                                isManager = false;
                              });
                            },
                            title: AppString.agent,
                            icon: 'assets/businessman.png',
                            color: !isManager
                                ? ColorsManager.backGroundColor
                                : Colors.transparent,
                          ),
                          RoleWidgwt(
                            onPressed: () {
                              setState(() {
                                isManager = true;
                              });
                            },
                            title: AppString.manager,
                            icon: 'assets/database-management.png',
                            color: isManager
                                ? ColorsManager.backGroundColor
                                : Colors.transparent,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFromField(
                        controller: emailController,
                        label: AppString.email,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFromField(
                        controller: passwordController,
                        label: AppString.password,
                      ),
                      CustomButton(
                        text: AppString.login,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (isManager) {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: const ManagerScreen(),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: const AgentScreen(),
                                ),
                              );
                            }
                          }
                        },
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: const AdminScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
