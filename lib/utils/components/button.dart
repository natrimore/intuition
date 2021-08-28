import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intuition/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final Function()? onTap;

  const CustomButton({Key? key, required this.buttonTitle, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 52),
        primary: AppColors.primaryColor,
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      onPressed: onTap,
      child: Text(
        buttonTitle,
        style: TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }
}
