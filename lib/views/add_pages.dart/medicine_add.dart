import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_check/const/colors.dart';
import 'package:medi_check/const/custom_widget.dart';
import 'package:medi_check/model/medicine_model.dart';
import 'package:medi_check/provider/medicine_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MedicineAddPage extends StatefulWidget {
  const MedicineAddPage({super.key});

  @override
  State<MedicineAddPage> createState() => _MedicineAddPageState();
}

class _MedicineAddPageState extends State<MedicineAddPage> {
  final _medicineNameController = TextEditingController();
  final _cureController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final medicineProvider = Provider.of<MedicineProvider>(context);

    return Scaffold(
      backgroundColor: blueC,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: 'Add Medicines'.text.white.make(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextField(
                hint: "Enter Medicine Name",
                controller: _medicineNameController),
            CustomTextField(
                hint: "Enter Cure Name", controller: _cureController),
            Spacer(),
            CustomButton(
                context: context,
                onpress: () {
                  // creating new model for adding in medicne list
                  var newMedicineModel = MedicineModel(
                      medicineName: _medicineNameController.text,
                      medicineReason: _cureController.text);

                  //adding medicne in medicine List

                  medicineProvider.addMedicineData(newMedicineModel);
                  Get.back();
                  Get.showSnackbar(GetSnackBar(
                    message: "Done Adding Medicine",
                    duration: Duration(seconds: 2),
                    backgroundColor: Color.fromARGB(255, 49, 33, 145),
                  ));
                })
          ],
        ),
      )),
    );
  }
}
