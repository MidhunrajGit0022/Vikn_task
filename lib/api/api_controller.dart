import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vikn_task/model/usermodel.dart';
import 'package:vikn_task/pages/bottomnav.dart';

class ApiController extends GetxController {
  static ApiController get instance => Get.find();

  TextEditingController usernamecontroller =
      TextEditingController(text: 'Rabeeh@vk');
  TextEditingController passwordcontroller =
      TextEditingController(text: 'Rabeeh@000');

  String? _token;
  int? _userId;
  Future<void> login(String username, String password) async {
    final url =
        Uri.parse('https://api.accounts.vikncodes.com/api/v1/users/login');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
          'is_mobile': true,
        }),
      );
      log("Got it ${response.body}");
      if (response.statusCode == 200) {
        Get.off(() => const BottomNavigation());
        final jsonData = jsonDecode(response.body);
        final userdata = Userdata.fromJson(jsonData);
        _token = userdata.data?.access;
        _userId = userdata.userId;

        log("Login Successfull");
        Get.snackbar("Successfull", "Login Successfull",
            backgroundColor: Colors.white);
      } else if (response.statusCode == 401) {
        Get.snackbar("Failed", "Invalid email or password",
            backgroundColor: Colors.red);
      } else {
        Get.snackbar("Failed", "Login Failed", backgroundColor: Colors.red);
        throw Exception('Failed to login: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
