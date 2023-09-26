import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controller/quizController.dart';
import 'package:untitled1/Core/appColor.dart';

class ProgressTimer extends StatelessWidget {
  ProgressTimer({Key? key}) : super(key: key);
  final controller = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => SizedBox(
        height: 30,
        width: 30,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: 1 - (controller.sec.value /17),
              color: KPrimaryColor,
              backgroundColor: Colors.grey,
              strokeWidth: 8,
            ),
            Center(
              child: Text(
                '${controller.sec.value}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: KPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}