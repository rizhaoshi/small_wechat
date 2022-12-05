import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'found_controller.dart';

class FoundPage extends GetView<FoundController> {
  const FoundPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'FoundView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
