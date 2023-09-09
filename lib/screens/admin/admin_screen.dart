import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madkour_task/core/color_manager.dart';
import 'package:madkour_task/widgets/custom_button.dart';
import 'package:madkour_task/widgets/header.dart';
import 'package:madkour_task/widgets/text_form_field.dart';
import 'package:intl/intl.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool? valueManager = false;
  bool? valueAgent = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Header(
                  name: 'Admin name',
                  image: "assets/businessman.png",
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: .3,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create a new user',
                        style: TextStyle(
                          fontSize: 22,
                          color: ColorsManager.mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFromField(
                        controller: nameController,
                        label: 'Name',
                        suffix: const Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      CustomTextFromField(
                        controller: addressController,
                        label: 'Email',
                        suffix: const Icon(
                          Icons.email,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      CustomTextFromField(
                        controller: birthdateController,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            birthdateController.text = formattedDate;
                          }
                        },
                        label: 'Birthdate',
                        suffix: const Icon(
                          Icons.date_range_outlined,
                          size: 30,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Agent',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Checkbox(
                            value: valueAgent,
                            onChanged: (newValue) {
                              setState(() {
                                valueAgent = newValue;
                                valueManager = false;
                              });
                            },
                          ),
                          const Spacer(),
                          const Text(
                            'Manager',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Checkbox(
                            value: valueManager,
                            onChanged: (newValue) {
                              setState(() {
                                valueManager = newValue;
                                valueAgent = false;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        text: 'Save',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Fluttertoast.showToast(
                              msg: "The customer has been created successfully",
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
