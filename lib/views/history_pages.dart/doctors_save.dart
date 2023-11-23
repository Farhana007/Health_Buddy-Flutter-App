import 'package:flutter/material.dart';
import 'package:medi_check/model/doctors_model.dart';
import 'package:medi_check/provider/doctor_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const/colors.dart';

class SaveDoctorList extends StatefulWidget {
  const SaveDoctorList({super.key});

  @override
  State<SaveDoctorList> createState() => _SaveDoctorListState();
}

class _SaveDoctorListState extends State<SaveDoctorList> {
  @override
  Widget build(BuildContext context) {
    double _takeWidth = MediaQuery.sizeOf(context).width;
    //creating the provider and DoctorProvider instance to call the list

    final doctorProvider = Provider.of<DoctorProvider>(context);

    List<DoctorModel> doctorsList = doctorProvider.doctorList;

    return Scaffold(
      backgroundColor: blueC,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: 'Saved Doctor List'.text.white.make(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                itemCount: doctorsList.length,
                itemBuilder: (context, index) {
                  var newDoctorList = doctorsList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 40),
                    child: Container(
                      child: Center(
                        child: ListTile(
                          title: newDoctorList.docName.text.extraBlack.make(),
                          subtitle: newDoctorList.docAddress.text.make(),
                          trailing:
                              newDoctorList.docNumber.text.size(15).make(),
                        ),
                      ),
                    )
                        .box
                        .rounded
                        .width(_takeWidth)
                        .height(120)
                        .white
                        .shadow3xl
                        .make(),
                  );
                }),
          )
        ]),
      )),
    );
  }
}
