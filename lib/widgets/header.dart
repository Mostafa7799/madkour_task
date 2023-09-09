import 'package:flutter/material.dart';
import 'package:madkour_task/screens/input/input_screen.dart';
import 'package:page_transition/page_transition.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.name,
    required this.image,
  });
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// User profile
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            image,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcom, $name',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Let's go back to work.",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                child: const InputScreen(),
              ),
            );
          },
          icon: const Icon(Icons.logout),
        )
      ],
    );
  }
}
