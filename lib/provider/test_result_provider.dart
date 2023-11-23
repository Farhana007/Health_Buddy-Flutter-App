import 'package:flutter/cupertino.dart';
import 'package:medi_check/model/test_result_model.dart';

class TestResultProvider extends ChangeNotifier {
  //list of TestResult Model
  List<TestResultModel> _testResults = [];

  //get the result for local use
  List<TestResultModel> get testResults => _testResults;

  //creating method to add result in list
  void addTestResult(TestResultModel testResultModel) {
    _testResults.add(testResultModel);
    notifyListeners();
  }
}
