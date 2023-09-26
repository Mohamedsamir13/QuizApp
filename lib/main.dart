import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Core/translation.dart';
import 'package:untitled1/Utlis/binding.dart';
import 'package:untitled1/View/QuizScreen/quizScreen.dart';
import 'package:untitled1/View/ResultScreen/Result.dart';
import 'package:untitled1/View/layOut.dart';
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Lang(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en_US'),
      debugShowCheckedModeBanner: false,
      initialBinding: MyBinding(),
      title: 'Flutter Quiz App',
      home:  const WelcomeScreen(),
      getPages: [
        GetPage(name: WelcomeScreen.routeName, page: () => WelcomeScreen()),
        GetPage(name: QuizScreen.routeName, page: () =>  QuizScreen()),
        GetPage(name: ResultScreen.routeName, page: () =>  ResultScreen()),
      ],
    );
  }
}