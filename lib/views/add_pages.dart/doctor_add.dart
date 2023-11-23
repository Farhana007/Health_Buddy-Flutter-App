import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_check/const/colors.dart';
import 'package:medi_check/const/custom_widget.dart';
import 'package:medi_check/model/doctors_model.dart';
import 'package:medi_check/provider/doctor_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class DoctorDetailAddPage extends StatefulWidget {
  const DoctorDetailAddPage({super.key});

  @override
  State<DoctorDetailAddPage> createState() => _DoctorDetailAddPageState();
}

class _DoctorDetailAddPageState extends State<DoctorDetailAddPage> {
  final _doctorNameController = TextEditingController();
  final _doctorAdressController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Creating  the provider instance

    final doctorProvider = Provider.of<DoctorProvider>(context);

    return Scaffold(
      backgroundColor: blueC,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: 'Add Doctor Details'.text.white.make(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextField(
                hint: "Enter Doctor Name", controller: _doctorNameController),
            CustomTextField(
                hint: "Doctor Address", controller: _doctorAdressController),
            CustomTextField(
                hint: "Phone Number", controller: _phoneNumberController),
            Spacer(),
            CustomButton(
                context: context,
                onpress: () {
                  //creating new instance of doctorModel

                  var newDoctorModel = DoctorModel(
                      docName: _doctorNameController.text,
                      docAddress: _doctorAdressController.text,
                      docNumber: _phoneNumberController.text);

                  //adding the add method

                  doctorProvider.addDoctorDetails(newDoctorModel);
                  Get.back();
                  Get.showSnackbar(GetSnackBar(
                    message: "Done Adding Doctor Details",
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
