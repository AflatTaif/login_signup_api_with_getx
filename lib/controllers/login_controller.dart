import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
class LoginController extends GetxController{

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;
  void loginApi() async{
    loading.value = true;
    try{
      final response =await post(Uri.parse('https://reqres.in/api/login'),
          body: {
            "email": emailController.value.text,
            "password": passwordController.value.text,
          }
      );
      var data = jsonDecode(response.body);

      if(response.statusCode == 200){
        loading.value = false;
        Get.snackbar("Login successful", "congrats!");
        // ScaffoldMessenger(child: Text("Success"));
      }else{
        loading.value = false;
        Get.snackbar("Bombola😜", "Login failed");
      }
    }catch(e){
      loading.value = false;
      Get.snackbar("Error", "found some exceptions");
    }



  }


}