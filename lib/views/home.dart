import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_check/views/history_pages.dart/test_result_history.dart';
import 'package:medi_check/views/history_pages.dart/diseases_history.dart';
import 'package:medi_check/views/history_pages.dart/doctors_save.dart';
import 'package:medi_check/views/history_pages.dart/medicine_save.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:decorated_icon/decorated_icon.dart';

import '../const/colors.dart';
import 'add_selection_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//List Of Paths
  List<Widget> _pathS = [
    TestResultPage(),
    MedicineSave(),
    SaveDoctorList(),
    DiseasesHistory()
  ];

  //list of String
  List<String> _titleL = ["Test Results", "Medicines", "Doctors", "Diseases"];

  //List of Icon Data

  List<IconData> _iconL = [
    Icons.medical_information,
    Icons.medication_outlined,
    Icons.personal_injury,
    Icons.history_edu_outlined
  ];

  @override
  Widget build(BuildContext context) {
    // taking the contextData
    double _takeHeight = MediaQuery.sizeOf(context).height;
    double _takeWidth = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: blueC,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 20, bottom: 20, right: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      20.widthBox,
                      Container(
                        child:
                            "Did You Know An Apple a day Keeps the Doctors Away?"
                                .text
                                .extraBlack
                                .size(15)
                                .align(TextAlign.center)
                                .make(),
                      ).box.width(160).make(),
                      Stack(
                        children: [
                          Image.asset(
                            "assets/images/doctor_mc.png",
                            height: 200,
                          ),
                          Positioned(
                              top: 0,
                              right: 1,
                              child: "Hi"
                                  .text
                                  .white
                                  .semiBold
                                  .makeCentered()
                                  .box
                                  .color(blueC)
                                  .topRounded(value: 10)
                                  //.bottomRightRounded(value: 15)
                                  .size(70, 30)
                                  .make())
                        ],
                      ),
                    ],
                  ),
                ),
              )
                  .box
                  .size(_takeWidth, _takeHeight * 0.25)
                  .bottomLeftRounded(value: 150)
                  .white
                  .make(),
              80.heightBox,
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 80, horizontal: 35),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => _pathS[index]);
                            },
                            child: Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(
                                        _iconL[index],
                                        size: 40,
                                        color: blueC,
                                      ),
                                    ).box.size(60, 60).roundedSM.white.make(),
                                    8.heightBox,
                                    _titleL[index]
                                        .text
                                        .size(15)
                                        .semiBold
                                        .white
                                        .align(TextAlign.center)
                                        .makeCentered(),
                                  ]),
                            )
                                .box
                                .height(40)
                                .width(100)
                                .color(blueC)
                                .rounded
                                .shadow2xl
                                .make(),
                          ),
                        );
                      }),
                ),
              )
                  .box
                  .width(_takeWidth)
                  .height(_takeHeight * 0.7)
                  .white
                  .topRightRounded(value: 150)
                  .make(),
            ],
          ),
        ),
      )),
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.to(() => AddPage());
        },
        child: "Add What You Want to Save"
            .text
            .white
            .makeCentered()
            .box
            .color(blueC)
            .size(220, 60)
            .roundedLg
            .shadow
            .make(),
      ),
    );
  }
}
