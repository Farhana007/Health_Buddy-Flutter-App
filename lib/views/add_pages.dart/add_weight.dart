import 'package:flutter/material.dart';
import 'package:medi_check/model/medicine_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import '../../const/colors.dart';
import '../../const/custom_widget.dart';

class AddWeight extends StatefulWidget {
  const AddWeight({super.key});

  @override
  State<AddWeight> createState() => _AddWeightState();
}

class _AddWeightState extends State<AddWeight> {
  //Controller

  final _weightController = TextEditingController();
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueC,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: 'Add Weight'.text.white.make(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextField(hint: "Enter Name", controller: _nameController),
            CustomTextField(
                hint: "Enter Weight", controller: _weightController),
            Spacer(),
            CustomButton(
                context: context,
                onpress: () {
                  // creating new model for adding in medicne list
                })
          ],
        ),
      )),
    );
  }
}
