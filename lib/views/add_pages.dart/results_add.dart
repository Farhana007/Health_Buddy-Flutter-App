import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi_check/const/colors.dart';
import 'package:medi_check/const/custom_widget.dart';
import 'package:medi_check/model/test_result_model.dart';
import 'package:medi_check/provider/test_result_provider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class TestResultAddPage extends StatefulWidget {
  const TestResultAddPage({super.key});

  @override
  State<TestResultAddPage> createState() => _TestResultAddPageState();
}

class _TestResultAddPageState extends State<TestResultAddPage> {
  //controllers
  final _nameController = TextEditingController();
  final _testNameController = TextEditingController();
  final _testResultController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //getting the provider
    var testResultProvider = Provider.of<TestResultProvider>(context);

    return Scaffold(
      backgroundColor: blueC,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: 'Add Test Results'.text.white.make(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextField(
                hint: "Enter Test Name", controller: _testNameController),
            CustomTextField(
                hint: "Enter Your Name", controller: _nameController),
            CustomTextField(
                hint: "Enter Test Result", controller: _testResultController),
            CustomTextField(hint: "Enter Date", controller: _dateController),
            Spacer(),
            CustomButton(
                context: context,
                onpress: () {
                  //creating new Model FOr testResult
                  var newTestResult = TestResultModel(
                      testName: _testNameController.text,
                      patientName: _nameController.text,
                      testResult: _testResultController.text,
                      addingDate: _dateController.text);

                  //ading testReslut to list

                  testResultProvider.addTestResult(newTestResult);
                  Get.back();
                  Get.showSnackbar(GetSnackBar(
                    message: "Done Adding Test Result",
                    duration: Duration(seconds: 2),
                    backgroundColor: Color.fromARGB(255, 49, 33, 145),
                  ));
                  //Vx.showToast(msg: "Your data added succesfulle");
                })
          ],
        ),
      )),
    );
  }
}
