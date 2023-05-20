import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:foodshopapp/utils/utiles.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';



class AuthController extends GetxController{

  //login method
  Future<UserCredential?> loginMethod({email,password,context})async{
    UserCredential? userCredential;

    try{
      userCredential =  await auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      debugPrint(e.toString());
    }

    return userCredential;
  }

  //signup Method
  Future<UserCredential?> signUpMethod({email,password})async{
    UserCredential? userCredential;
    try{
      userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      debugPrint(e.toString());
    }

    return userCredential;
  }

  //storing data method
  storeUserData({name,email,password,mobile})async{
    CollectionReference collectionRef =  firestore.collection(userCollection);
    return collectionRef.doc(currentUser!.email).set({
      'name': name,
      'password': password,
      'email' : email,
      'mobile' : mobile,
      'imageUrl' : ''
    }).then((value){
      Utiles().toastMessage("Account Created Successfully");
    }).catchError((onError) {
        Utiles().toastMessage("Account Created Successfully");
    });
  }

  //signOut method
  signOutMethod(context)async{
    try{
      await auth.signOut();
    }catch(e){
      debugPrint(e.toString());
    }
  }

}