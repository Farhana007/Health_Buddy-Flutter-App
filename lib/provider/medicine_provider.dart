import 'package:flutter/material.dart';
import 'package:medi_check/model/medicine_model.dart';

class MedicineProvider extends ChangeNotifier {
  //creating the list of MedicineModel

  List<MedicineModel> _medicineList = [];

  //getting the medicine list in provider

  List<MedicineModel> get medicineList => _medicineList;

  //creating the method to add data in medicinelist

  void addMedicineData(MedicineModel medicineModel) {
    _medicineList.add(medicineModel);
    notifyListeners();
  }
}
