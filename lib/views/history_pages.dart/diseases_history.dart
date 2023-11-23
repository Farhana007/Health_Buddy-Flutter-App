import 'package:flutter/material.dart';
import 'package:medi_check/const/colors.dart';
import 'package:medi_check/model/diseases_model.dart';
import 'package:medi_check/provider/diseases_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class DiseasesHistory extends StatefulWidget {
  const DiseasesHistory({super.key});

  @override
  State<DiseasesHistory> createState() => _DiseasesHistoryState();
}

class _DiseasesHistoryState extends State<DiseasesHistory> {
  @override
  Widget build(BuildContext context) {
    //creating instance of Disease Provider and List of Datas

    final diseasesProvider = Provider.of<DiseasesProvider>(context);

//    List<DiseasesModel> diseasesList = diseasesProvider.diseasesList;

    return Scaffold(
      backgroundColor: blueC,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: 'Diseases History'.text.white.make(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: diseasesProvider.diseasesList.length,
                    itemBuilder: (context, index) {
                      var newDiseasesList =
                          diseasesProvider.diseasesList[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: newDiseasesList
                                    .patientName.text.extraBold
                                    .make(),
                                subtitle:
                                    newDiseasesList.addingDate.text.make(),
                                trailing: Column(
                                  children: [
                                    newDiseasesList.diseaseName.text
                                        .color(redC)
                                        .size(18)
                                        .make(),
                                    8.heightBox,
                                    "${newDiseasesList.duration} days"
                                        .text
                                        .make()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ).box.white.roundedSM.make(),
                      );
                    }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
