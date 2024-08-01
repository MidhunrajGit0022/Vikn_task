import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task/api/api_controller.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final apicontroller = Get.put(ApiController());
  RxBool obscureText = true.obs;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Color Defaultcolor = const Color(0xFF0E75F4);
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.language,
                      color: Defaultcolor,
                    ),
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    const Text(
                      "English",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.01,
                            ),
                            const Text(
                              "Login to your vikn account",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 20),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.03,
                            ),
                            TextField(
                              controller: apicontroller.usernamecontroller,
                              cursorColor: Colors.white,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: "Username",
                                labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                prefixIcon: Icon(Icons.person_outline,
                                    color: Defaultcolor),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Defaultcolor),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Defaultcolor),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => TextField(
                                controller: apicontroller.passwordcontroller,
                                obscureText: obscureText.value,
                                cursorColor: Colors.white,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Defaultcolor,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureText.value = !obscureText.value;
                                      });
                                    },
                                    icon: Icon(
                                      obscureText.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Defaultcolor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Defaultcolor),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Defaultcolor),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.03,
                            ),
                            Text(
                              "Forgotten Password?",
                              style:
                                  TextStyle(color: Defaultcolor, fontSize: 20),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.03,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0E75F4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                minimumSize: const Size(120, 50),
                              ),
                              onPressed: () {
                                apicontroller.login(
                                    apicontroller.usernamecontroller.text,
                                    apicontroller.passwordcontroller.text);
                              },
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Sign In",
                                      style: TextStyle(fontSize: 18)),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward, size: 18),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Text(
                  "Sign up now!",
                  style: TextStyle(color: Defaultcolor, fontSize: 20),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
              ],
            ),
          ),
        ));
  }
}
