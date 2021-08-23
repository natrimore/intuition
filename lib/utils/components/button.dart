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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(7, 10), blurRadius: 10, color: AppColors.grey)
            ]),
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
