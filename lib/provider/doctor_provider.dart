import 'package:flutter/cupertino.dart';
import 'package:medi_check/model/doctors_model.dart';

class DoctorProvider extends ChangeNotifier {
  //making the doctor model list

  List<DoctorModel> _doctorList = [];

  //gettign the doctorlist in provider

  List<DoctorModel> get doctorList => _doctorList;

//creating a method to adding doctorDetails in the doctor list

  void addDoctorDetails(DoctorModel doctorModel) {
    _doctorList.add(doctorModel);
    notifyListeners();
  }
}
