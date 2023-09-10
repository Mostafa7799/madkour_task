import 'package:flutter/material.dart';

import '../../data/customer_data.dart';
import '../../widgets/create_customer.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/dialog.dart';
import '../../widgets/header.dart';
import '../../widgets/list_card.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  _ManagerScreenState createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    List filteredCustomerData = customerData
        .where((customer) =>
            selectedStatus == null || customer['status'] == selectedStatus)
        .toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Header(
              name: 'Manager name',
              image: 'assets/businessman.png',
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                const Text(
                  '  Filter',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: filteredCustomerData.isEmpty
                    ? const Center(
                        child: Text(
                          'No data',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredCustomerData.length,
                        itemBuilder: (context, index) {
                          return ListCardTest(
                            id: filteredCustomerData[index]['name'] ?? '',
                            leftIcon: Icons.date_range_outlined,
                            leftText:
                                filteredCustomerData[index]['birthdate'] ?? '',
                            rightIcon: Icons.location_city,
                            rightText:
                                filteredCustomerData[index]['address'] ?? '',
                            status: filteredCustomerData[index]['status'] ?? '',
                            onPressed: (context) {
                              AnimatedDialog.showAnimatedDialog(
                                context,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 80,
                                    horizontal: 20,
                                  ),
                                  child: CreateCustomerWidget(
                                    isEditing: true,
                                    isManager: true,
                                    currentIndex: index,
                                    name: filteredCustomerData[index]['name'],
                                    address: filteredCustomerData[index]
                                        ['address'],
                                    birthDate: filteredCustomerData[index]
                                        ['birthdate'],
                                    status: filteredCustomerData[index]
                                        ['status'],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          height: 80,
          width: 100,
          child: CustomButton(
            text: "Create",
            onPressed: () {
              AnimatedDialog.showAnimatedDialog(
                context,
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 80,
                    horizontal: kIsWeb ? 120 : 20,
                  ),
                  child: CreateCustomerWidget(
                    isManager: true,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
