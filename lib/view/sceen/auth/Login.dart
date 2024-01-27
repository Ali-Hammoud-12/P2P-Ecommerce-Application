import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:senior_porj/core/class/statusrequest.dart';
import 'package:senior_porj/view/widget/customTextAuth/custombodytextaut.dart';
import 'package:senior_porj/view/widget/customTextAuth/customtextformauth.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/customTextAuth/custombuttonauth.dart';
import '../../widget/customTextAuth/customtitletextauth.dart';
import '../../widget/customTextAuth/logoauth.dart';
import '../../widget/customTextAuth/textsignup.dart';

class Login extends StatelessWidget {
  
  const Login({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Log In",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white)),
        backgroundColor: Color.fromARGB(218, 9, 85, 206),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const LogoAuth(),
                          const CusstomTitleTextAuth(
                            titleText: "Welcome Back",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const CustomBodyTextAuth(
                              text: "Log In With Your Email And Password "),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return ValidInput(val!, 8, 100, "email");
                              },
                              labeltext: "Email",
                              inconData: Icons.email_outlined,
                              mycontroller: controller.email),
                          GetBuilder<LoginControllerImp>(
                            builder: (controller) => CustomTextFormAuth(
                                obsecureText: controller.isshowpassword,
                                onTapIcon: () {
                                  controller.showPassword();
                                },
                                isNumber: false,
                                valid: (val) {
                                  return ValidInput(val!, 8, 100, "password");
                                },
                                labeltext: "Password",
                                inconData: Icons.lock_outlined,
                                mycontroller: controller.password),
                          ),
                          InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: const Text(
                              "Forgot Password",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          CustomButtonAuth(
                            text: "Log in",
                            onpressed: () {
                              controller.login();
                            },
                          ),
                          CustomTextSignUpAndSignIn(
                            textone: "Dont have an account?",
                            texttwo: " Sign Up",
                            onTap: () {
                              controller.goToChooseSignUp();
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
