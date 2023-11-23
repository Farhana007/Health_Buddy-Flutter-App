import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_check/const/colors.dart';
import 'package:medi_check/const/custom_widget.dart';
import 'package:medi_check/model/diseases_model.dart';
import 'package:medi_check/provider/diseases_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class DiseasesAddPage extends StatefulWidget {
  const DiseasesAddPage({super.key});

  @override
  State<DiseasesAddPage> createState() => _DiseasesAddPageState();
}

class _DiseasesAddPageState extends State<DiseasesAddPage> {
  final _nameController = TextEditingController();
  final _diseasesNameController = TextEditingController();
  final _durationController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //creating the provider instance

    final diseaesProvider = Provider.of<DiseasesProvider>(context);

    return Scaffold(
      backgroundColor: blueC,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: 'Add Diseases History'.text.white.make(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextField(
                hint: "Enter Patient Name", controller: _nameController),
            CustomTextField(
                hint: "Enter Diseases Name",
                controller: _diseasesNameController),
            CustomTextField(
                hint: "Enter Starting Date", controller: _dateController),
            CustomTextField(hint: "Duration", controller: _durationController),
            Spacer(),
            CustomButton(
                context: context,
                onpress: () {
                  //creating the new diseases Model Instance

                  var newDiseaseModel = DiseasesModel(
                      diseaseName: _diseasesNameController.text,
                      patientName: _nameController.text,
                      addingDate: _dateController.text,
                      duration: _durationController.text);

                  //adding the newDiseaseModel data in list  with the function created in provider

                  diseaesProvider.addDiseasesHistory(newDiseaseModel);
                  Get.back();
                  Get.showSnackbar(GetSnackBar(
                    message: "Done Adding Diseases History",
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
