import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controller/quizController.dart';
import 'package:untitled1/Core/appColor.dart';
import 'package:untitled1/Core/images.dart';
import 'package:untitled1/Core/sizes.dart';
import 'package:untitled1/View/Widgets/floatingButton.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);
  static const routeName = '/result_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Images.blackImage), fit: BoxFit.cover),
          ),
        ),
        Center(
          child: GetBuilder<QuizController>(
            init: Get.find<QuizController>(),
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Congratulation',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white,
                      ),
                ),
                SizedBox(
                  height: displaySize(context).height*0.09,
                ),
                Text(
                  controller.name,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: KPrimaryColor,
                      ),
                ),
                SizedBox(
                  height: displaySize(context).height*0.05,
                ),
                Text(
                  'Good luck'.tr,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,

                      ),
                ),
            OutlinedButton(
              onPressed: () {
                if (Get.locale?.languageCode == 'ar') {
                  Get.updateLocale(const Locale('en', 'US'));
                } else {
                  Get.updateLocale(const Locale('ar'));
                }
              },
              child: Text(
                Get.locale?.languageCode == 'ko' && Get.locale?.countryCode == 'KR'
                    ? 'Korean'
                    : 'English',
              ),
            ),
                SizedBox(
                  height: displaySize(context).height*0.05,
                ),
                Text(
                  '${controller.scoreResult.round()} /100',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: KPrimaryColor,
                      ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.07,
                ),
                CustomButton(
                    onPressed: () => controller.startAgain(),
                    text: 'Start Again'),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
