import 'package:get/get.dart';
import 'package:untitled1/Controller/quizController.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => QuizController());
  }
}