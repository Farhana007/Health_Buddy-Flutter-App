import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medi_check/const/colors.dart';
import 'package:velocity_x/velocity_x.dart';

//custom TextField

Widget CustomTextField({required String hint, required controller}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: CupertinoTextField.borderless(
          prefix: Icon(Icons.lock),
          controller: controller,
          cursorColor: Vx.black,
          placeholder: hint,
        ),
      ),
    ).box.border(color: Colors.black).height(60).roundedSM.white.make(),
  );
}

//Custom BuTTON

Widget CustomButton({onpress, required BuildContext context}) {
  return GestureDetector(
      onTap: onpress,
      child: Container(
              child: "Save".text.semiBold.size(18).color(blueC).makeCentered())
          .box
          .size(MediaQuery.sizeOf(context).width * 0.8, 60)
          .roundedLg
          .white
          .make());
}
