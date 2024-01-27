import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/auth/successsignup_controller.dart';
import 'package:senior_porj/view/widget/customTextAuth/custombuttonauth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: Colors.blue,
          )),
          Text(" Congratulations",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 30)),
          const Text("Successfully register"),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: CustomButtonAuth(
                text: "Go To Login ",
                onpressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
