import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_check/provider/diseases_provider.dart';
import 'package:medi_check/provider/doctor_provider.dart';
import 'package:medi_check/provider/medicine_provider.dart';
import 'package:medi_check/provider/test_result_provider.dart';
import 'package:provider/provider.dart';
import 'views/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => TestResultProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => MedicineProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => DoctorProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => DiseasesProvider(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            appBarTheme:
                AppBarTheme(iconTheme: IconThemeData(color: Colors.white))),
        home: HomePage()
        // home: CustomTabbar(),
        );
  }
}
