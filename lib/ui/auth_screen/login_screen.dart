import 'package:flutter/material.dart';
import 'package:foodshopapp/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../utils/themes.dart';
import '../../widgets/custom_button.dart';
import '../home/home_screen.dart';
import 'sign_up_screen.dart';
import 'widgets/custom_text_field.dart';

class LogInScreen extends StatelessWidget {
   LogInScreen({Key? key}) : super(key: key);

   final controller = Get.put(AuthController());


  final _key = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome",style: bigTitleStyle,),
              const SizedBox(height: 10),
              Text("Enter your email and password",style: textStyle,),
              const SizedBox(height: 20),
              CustomTextField(controller: emailController, title: 'Email', hintText: 'Enter your email', validateText: 'Required right Email', ),
              const SizedBox(height: 20),
              CustomTextField(controller: passController,obscure: true, title: 'Password', hintText: 'Enter your Password', validateText: 'Required pass',),
              const SizedBox(height: 20),
              CustomButton(
                title: 'Log In',
                onTap: ()async{
                  if(_key.currentState!.validate()){
                    try{
                      await controller.loginMethod(email: emailController.text,password: passController.text).then((value) {
                        if(value != null){
                          Get.to(const HomeScreen());
                        }
                      });
                    }catch(e){
                      debugPrint(" something problem ");
                    }
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(onPressed: (){ Get.to(const SignUpScreen());}, child: Text("sign Up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
