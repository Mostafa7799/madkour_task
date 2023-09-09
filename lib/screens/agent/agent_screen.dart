import 'package:flutter/material.dart';
import 'package:madkour_task/widgets/header.dart';

class AgentScreen extends StatelessWidget {
  const AgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
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
            
          ],
        ),
      ),
    );
  }
}
