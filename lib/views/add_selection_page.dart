import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_check/views/add_pages.dart/diseases_add.dart';
import 'package:medi_check/views/add_pages.dart/doctor_add.dart';
import 'package:medi_check/views/add_pages.dart/medicine_add.dart';
import 'package:medi_check/views/add_pages.dart/results_add.dart';
import 'package:velocity_x/velocity_x.dart';

import '../const/colors.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  //headline of Selectio
  List<String> _headLineL = [
    "Save Diabetic/Blood Pressure/Fever Results",
    "Save Medicines Names",
    "Save Doctors Information",
    "Save Diseases History"
  ];

  //List Of Paths
  List<Widget> _pathS = [
    TestResultAddPage(),
    MedicineAddPage(),
    DoctorDetailAddPage(),
    DiseasesAddPage()
  ];

  @override
  Widget build(BuildContext context) {
    double _takeHeight = MediaQuery.sizeOf(context).height;
    double _takeWidth = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: blueC,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Select What You Want To Save:".text.white.size(20).make(),
            40.heightBox,
            Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => _pathS[index]);
                          },
                          child: Container(
                            child: Center(
                              child: ListTile(
                                leading: Icon(Icons.pending),
                                title:
                                    _headLineL[index].text.color(blueC).make(),
                              ),
                            ),
                          )
                              .box
                              .size(_takeWidth, 80)
                              .white
                              .topRightRounded(value: 20)
                              .make(),
                        ),
                      );
                    }))
          ],
        ),
      )),
    );
  }
}
