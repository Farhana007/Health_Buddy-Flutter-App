import 'package:flutter/material.dart';
import 'package:medi_check/model/diseases_model.dart';

class DiseasesProvider extends ChangeNotifier {
  //Creating the List of DiseasesModel

  List<DiseasesModel> _diseasesList = [];

  //Getting teh diseasesList

  List<DiseasesModel> get diseasesList => _diseasesList;

  //creating the Function to adding diseaseshistory in the DiseasesList

  void addDiseasesHistory(DiseasesModel diseasesModel) {
    _diseasesList.add(diseasesModel);
    notifyListeners();
  }
}
