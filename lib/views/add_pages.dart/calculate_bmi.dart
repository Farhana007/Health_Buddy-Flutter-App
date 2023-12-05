import 'package:flutter/material.dart';
import 'package:medi_check/const/colors.dart';
import 'package:medi_check/const/custom_widget.dart';
import 'package:velocity_x/velocity_x.dart';



class CalculateBMIPage extends StatefulWidget {
  const CalculateBMIPage({super.key});

  @override
  State<CalculateBMIPage> createState() => _CalculateBMIPageState();
}

class _CalculateBMIPageState extends State<CalculateBMIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueC,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: 'Calculate BMI'.text.white.make(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // CustomTextField(
            //     hint: "Enter Medicine Name",
            //     controller: _medicineNameController),
            // CustomTextField(
            //     hint: "Enter Weight", controller: _cureController),
            //     CustomTextField(hint: "Enter Height", controller: controller),
            Spacer(),
            CustomButton(
                context: context,
                onpress: () {

                  
                  
                })
          ],
        ),
      )),
    );
    
  }
}
