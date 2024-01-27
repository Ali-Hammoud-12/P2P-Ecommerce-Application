import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/controller/auth/signup_controller.dart';
import 'package:senior_porj/core/class/handlingdataview.dart';
import 'package:senior_porj/core/functions/validinput.dart';
import 'package:senior_porj/view/widget/customTextAuth/customtextformauth.dart';
import 'package:senior_porj/view/widget/customTextAuth/logoauth.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widget/customTextAuth/custombuttonauth.dart';
import '../../widget/customTextAuth/customtitletextauth.dart';
import '../../widget/customTextAuth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Sign Up",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white)),
        backgroundColor: const Color.fromARGB(218, 9, 85, 206),
      ),
      body:  WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(builder: (controller)=> 
        HandlingDataRequest(statusRequest: controller.statusRequest, widget:  Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
             key: controller.formstate,
              child: ListView(
                children: [
                  const LogoAuth(),
                  const CusstomTitleTextAuth(
                    titleText: "Create Your Account",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormAuth(
                   
                    isNumber: false,
                      valid: (val) {
                      return  ValidInput(val!, 3, 25, "username");
                      
                      },
                      labeltext: "Username",
                      inconData: Icons.person_2_outlined,
                      mycontroller: controller.username),
                  CustomTextFormAuth(
                 
                    
                      valid: (val) {
                       return ValidInput(val!, 8, 100, "email");
                       
                      },
                      isNumber: false,
                      labeltext: "Email",
                      inconData: Icons.email_outlined,
                      mycontroller: controller.email),
                  CustomTextFormAuth(
                   
                    isNumber: true,
                      valid: (val) {
                       return ValidInput(val!, 7, 25, "phone");
                    
                      },
                      labeltext: "Phone",
                      inconData: Icons.phone_outlined,
                      mycontroller: controller.phone),
                  CustomTextFormAuth(
                   
                    isNumber: false,
                      valid: (val) {
                        return ValidInput(val!, 8, 25, "password");
                       
                      },
                      labeltext: "Password",
                      inconData: Icons.lock_outlined,
                      mycontroller: controller.password),
                  CustomButtonAuth(
                    text: "Sign Up",
                    onpressed: () {
                      controller.signUp();
                    },
                  ),
                  CustomTextSignUpAndSignIn(
                    textone: "Dont have an account?",
                    texttwo: " Login",
                    onTap: () {
                      controller.goToSignIn();
                    },
                  ),
                ],
              ),
            ),
          ),)
        )
      ),
      
    );
  }
}
