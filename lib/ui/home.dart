import 'package:fake_data_generator/router/router.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          myRouter.go('/user');
        },
        child: const Text('Goto User'),
      ),
    );
  }
}
