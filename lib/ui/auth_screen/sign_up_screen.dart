import 'package:flutter/material.dart';
import 'package:foodshopapp/controllers/auth_controller.dart';
import 'package:foodshopapp/ui/auth_screen/login_screen.dart';
import 'package:foodshopapp/ui/home/home_screen.dart';
import 'package:get/get.dart';

import '../../consts/firebase_consts.dart';
import '../../utils/themes.dart';
import '../../widgets/custom_button.dart';
import 'widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final AuthController controller = Get.put(AuthController());
  final _key = GlobalKey<FormState>();

  //text field controller
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                CustomTextField(controller: nameController, title: 'Name', hintText: 'Enter your Name', validateText: 'Required right Name', ),
                const SizedBox(height: 20),
                CustomTextField(controller: mobileController, title: 'Mobile', hintText: 'Enter your Mobile', validateText: 'Required right Mobile', ),
                const SizedBox(height: 20),
                CustomTextField(controller: emailController, title: 'Email', hintText: 'Enter your email', validateText: 'Required right Email', ),
                const SizedBox(height: 20),
                CustomTextField(controller: passwordController,obscure: true, title: 'Password', hintText: 'Enter your Password', validateText: 'Required pass',),
                const SizedBox(height: 20),
                CustomButton(title: 'Sign UP',onTap: ()async{
                  if(_key.currentState!.validate()){
                   try{
                     await controller.signUpMethod(
                         email: emailController.text,password:passwordController.text
                     ).then((value){
                       return controller.storeUserData(
                           email: emailController.text,
                           password: passwordController.text,
                           name: nameController.text,
                           mobile: mobileController.text
                       );
                     }).then((value) {
                       debugPrint("login successfully");
                       Get.offAll(()=> HomeScreen());
                     });
                   }catch(e){
                     debugPrint(e.toString());
                     auth.signOut();
                   }
                  }
                },),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(onPressed: (){ Get.offAll( LogInScreen());}, child: const Text("Log In"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
