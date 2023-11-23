import 'package:flutter/material.dart';
import 'package:medi_check/const/colors.dart';
import 'package:medi_check/model/test_result_model.dart';
import 'package:medi_check/provider/test_result_provider.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class TestResultPage extends StatefulWidget {
  const TestResultPage({super.key});

  @override
  State<TestResultPage> createState() => _TestResultPageState();
}

class _TestResultPageState extends State<TestResultPage> {
  @override
  Widget build(BuildContext context) {
    double _takeHeight = MediaQuery.sizeOf(context).height;
    double _takeWidth = MediaQuery.sizeOf(context).height;

    //Provider
    final testResultProvider = Provider.of<TestResultProvider>(context);
    //getting the Items
    List<TestResultModel> testResults = testResultProvider.testResults;

    return Scaffold(
      backgroundColor: blueC,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: 'Saved Test Results'.text.white.make(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: testResults.length,
                  itemBuilder: (context, index) {
                    var testResult = testResults[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  testResult.testName.text
                                      .size(18)
                                      .semiBold
                                      .black
                                      .make(),
                                  testResult.patientName.text.gray500
                                      .size(12)
                                      .make(),
                                ],
                              ),
                              20.heightBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  testResult.testResult.text
                                      .color(const Color.fromARGB(
                                          255, 220, 56, 56))
                                      .bold
                                      .size(20)
                                      .make(),
                                  testResult.addingDate.text.gray500
                                      .size(12)
                                      .make(),
                                ],
                              )
                            ],
                          ),
                        )),
                      ).box.size(_takeWidth, 120).rounded.white.make(),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }
}
