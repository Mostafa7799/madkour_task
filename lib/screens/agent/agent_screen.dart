import 'package:flutter/material.dart';
import 'package:madkour_task/widgets/custom_button.dart';
import 'package:madkour_task/widgets/header.dart';

import '../../data/customer_data.dart';
import '../../widgets/create_customer.dart';
import '../../widgets/dialog.dart';
import '../../widgets/list_card.dart';
import '../../widgets/search_file.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({super.key});

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Header(
              name: 'Agent name',
              image: 'assets/businessman.png',
            ),
          ),
        ),
        body: Column(
          children: [
            const SearchBarWidget(),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: customerData.length,
                  itemBuilder: (context, index) {
                    if (customerData[index]['createdBy'] == 'Agent') {
                      return ListCardTest(
                        id: customerData[index]['name'] ?? '',
                        leftIcon: Icons.date_range_outlined,
                        leftText: customerData[index]['birthdate'] ?? '',
                        rightIcon: Icons.location_city,
                        rightText: customerData[index]['address'] ?? '',
                        status: customerData[index]['status'] ?? '',
                        onPressed: (context) {},
                      );
                    }
                    return const SizedBox();
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
                    horizontal: 20,
                  ),
                  child: CreateCustomerWidget(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
