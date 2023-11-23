import 'package:flutter/material.dart';
import 'package:medi_check/const/colors.dart';
import 'package:medi_check/model/medicine_model.dart';
import 'package:medi_check/provider/medicine_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class MedicineSave extends StatefulWidget {
  const MedicineSave({super.key});

  @override
  State<MedicineSave> createState() => _MedicineSaveState();
}

class _MedicineSaveState extends State<MedicineSave> {
  @override
  Widget build(BuildContext context) {
    //creating provider instance and creating an List to add datas getting from provider

    final medicineProvider = Provider.of<MedicineProvider>(context);

    List<MedicineModel> medicineList = medicineProvider.medicineList;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: 'Saved Medicine List'.text.white.make(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: blueC,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: medicineProvider.medicineList.length,
                    itemBuilder: (context, index) {
                      var medicines = medicineList[index];

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              medicines.medicineName.text.extraBold
                                  .size(16)
                                  .align(TextAlign.center)
                                  .make(),
                              4.heightBox,
                              medicines.medicineReason.text.black.make(),
                            ],
                          ),
                        )
                            .box
                            //.size(150, 130)
                            .topRightRounded(value: 14)
                            .shadow4xl
                            .yellow300
                            .make(),
                      );
                    }))
          ],
        ),
      )),
    );
  }
}
