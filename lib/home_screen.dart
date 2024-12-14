import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_api_with_getx/controllers/login_controller.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LoginController controller = Get.put(LoginController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Login and Signup page using Getx'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: TextFormField(
                controller: controller.emailController.value,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    contentPadding: EdgeInsets.all(8)
                ),
              ),
            ),
            SizedBox(height: 15,),
            Card(
              child: TextFormField(

                controller: controller.passwordController.value,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                  contentPadding: EdgeInsets.all(8)
                ),
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: Obx((){
                return ElevatedButton(onPressed: (){
                  controller.loginApi();

                },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white
                    ),
                    child: controller.loading.value? CircularProgressIndicator(
                      color: Colors.white,
                    ): Text("Login", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                    ),
                    )
                );
              })
            )
          ],
        ),
      ),

    );
  }
}
