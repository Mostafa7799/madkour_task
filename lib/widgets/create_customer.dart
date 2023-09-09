import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:madkour_task/core/color_manager.dart';
import 'package:madkour_task/data/customer_data.dart';
import 'package:madkour_task/screens/agent/agent_screen.dart';
import 'package:madkour_task/screens/manager/manager_screen.dart';
import 'package:madkour_task/widgets/text_form_field.dart';

import 'custom_button.dart';

class CreateCustomerWidget extends StatefulWidget {
  const CreateCustomerWidget({
    super.key,
    this.name,
    this.address,
    this.birthDate,
    this.status,
    this.isEditing = false,
    this.isManager = false,
    this.currentIndex,
  });
  final String? name, address, birthDate, status;
  final bool isEditing, isManager;
  final int? currentIndex;

  @override
  State<CreateCustomerWidget> createState() => _CreateCustomerWidgetState();
}

class _CreateCustomerWidgetState extends State<CreateCustomerWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isBottomSheetOpen = false;
  String? selectedStatus;
  @override
  void initState() {
    if (widget.isEditing) {
      nameController = TextEditingController(text: widget.name);
      addressController = TextEditingController(text: widget.address);
      birthdateController = TextEditingController(text: widget.birthDate);
      selectedStatus = widget.status;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Create new customer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.mainColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
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
                label: 'Address',
                suffix: const Icon(
                  Icons.location_city_outlined,
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
                label: 'Birth Date',
                suffix: const Icon(
                  Icons.date_range_outlined,
                  size: 30,
                ),
              ),
              if (widget.isEditing)
                Row(
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      value: selectedStatus,
                      icon: const Icon(Icons.filter_list),
                      onChanged: (newValue) {
                        setState(() {
                          selectedStatus = newValue;
                        });
                      },
                      items: ['Draft', 'Approved', 'Rejected']
                          .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              const SizedBox(
                height: 14,
              ),
              CustomButton(
                text: 'Submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    
                    customerData.add({
                      'name': nameController.text,
                      'address': addressController.text,
                      'birthdate': birthdateController.text,
                      'status': widget.isEditing ? selectedStatus : 'Draft',
                      'createdBy': 'Agent',
                    });

                    Fluttertoast.showToast(
                      msg: 'Customer submitted successfully',
                      backgroundColor: Colors.green,
                    );
                    if (widget.isManager) {
                      customerData.removeAt(widget.currentIndex!);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ManagerScreen();
                      }));
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AgentScreen();
                      }));
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
