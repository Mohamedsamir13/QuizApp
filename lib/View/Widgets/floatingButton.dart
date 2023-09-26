import 'package:flutter/material.dart';
import 'package:untitled1/Core/appColor.dart';
import 'package:untitled1/Core/sizes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,  double? width,
  }) : super(key: key);
  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {


    return Container(
      width:displayWidth(context)*0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: FloatingActionButton.extended(
        backgroundColor: KPrimaryColor,

        icon: const Icon(Icons.arrow_forward_ios),
        onPressed: onPressed,
        label: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}