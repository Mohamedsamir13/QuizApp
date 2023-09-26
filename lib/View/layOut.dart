import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controller/quizController.dart';
import 'package:untitled1/Core/appColor.dart';
import 'package:untitled1/Core/images.dart';
import 'package:untitled1/Core/sizes.dart';
import 'package:untitled1/View/QuizScreen/quizScreen.dart';
import 'package:untitled1/View/Widgets/floatingButton.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _nameController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

  void _submit(context) {
    FocusScope.of(context).unfocus();
    if (!_formkey.currentState!.validate()) return;
    _formkey.currentState!.save();
    Get.offAndToNamed(QuizScreen.routeName);
    Get.find<QuizController>().startTimer();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Images.blackImage), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(displayWidth(context) * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    const Text('Let\'s start Quiz,',
                        style: TextStyle(color: KPrimaryColor)),
                    Text(
                      'Enter your name to start',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Form(
                      key: _formkey,
                      child: GetBuilder<QuizController>(
                        init: Get.find<QuizController>(),
                        builder: (controller) =>
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      displayWidth(context) * 0.02),
                                  border: Border.all(
                                    color: Colors.grey,
                                    strokeAlign: BorderSide.strokeAlignCenter

                                  )),
                              child: TextFormField(
                                controller: _nameController,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    labelText: 'Full Name',
                                    labelStyle: const TextStyle(
                                        color: Colors.white),
                                    border: OutlineInputBorder(

                                        borderSide: BorderSide(
                                            width: displayWidth(context) *
                                                0.01),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15.0)))),
                                validator: (String? val) {
                                  if (val!.isEmpty) {
                                    return 'Name is valid';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (String? val) {
                                  controller.name = val!.trim().toUpperCase();
                                },
                                onFieldSubmitted: (_) => _submit(context),
                              ),
                            ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                          width: double.infinity,
                          onPressed: () => _submit(context),
                          text: 'Lets Start Quiz'),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
