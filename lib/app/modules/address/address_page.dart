import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'address_controller.dart';


class AddressPage extends GetView<AddressController> {
  const AddressPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
          'AddressView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
