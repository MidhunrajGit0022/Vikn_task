import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vikn_task/model/profilemodel.dart';
import 'package:vikn_task/model/sales_model.dart';
import 'package:vikn_task/model/usermodel.dart';
import 'package:vikn_task/pages/bottomnav.dart';

class ApiController extends GetxController {
  static ApiController get instance => Get.find();

  TextEditingController usernamecontroller =
      TextEditingController(text: 'Rabeeh@vk');
  TextEditingController passwordcontroller =
      TextEditingController(text: 'Rabeeh@000');
  TextEditingController searchcontroller = TextEditingController();

  String? _token;
  int? _userId;
  Userdata? userdata;
  SalesData? allsalesdata;
  Profiledata? allprofiledata;

  Rx<SalesData?> filteredSalesData = Rx<SalesData?>(null);
  Rx<SalesData?> searchsaleslist = Rx<SalesData?>(null);
  RxString filteredstatus = RxString('Pending');

  Future<void> login(String username, String password) async {
    final url =
        Uri.parse('https://api.accounts.vikncodes.com/api/v1/users/login');

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
    log(response.body);
    final jsonData = jsonDecode(response.body);

    if (jsonData['success'] == 6000) {
      Get.off(() => const BottomNavigation());
      userdata = Userdata.fromJson(jsonData);
      _token = userdata!.data?.access;
      _userId = userdata!.userId;
      Get.off(() => const BottomNavigation());

      log("Login Successfull");
      Get.snackbar("Successfull", "Login Successfull",
          backgroundColor: Colors.white);
    } else if (jsonData['success'] == 6001) {
      Get.snackbar("Failed", "Invalid email or password",
          backgroundColor: Colors.red);
    } else {
      Get.snackbar("Failed", "Login Failed", backgroundColor: Colors.red);
    }
  }

  Future<SalesData?> saleslist() async {
    try {
      final url = Uri.parse(
          'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/');

      final response = await http.post(url,
          headers: {
            'Authorization': 'Bearer ${userdata!.data?.access}',
            'Content-Type': 'application/json'
          },
          body: jsonEncode({
            "BranchID": 1,
            "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
            "CreatedUserID": "${userdata?.userId}",
            "PriceRounding": 2,
            "page_no": 1,
            "items_per_page": 249,
            "type": "Sales",
            "WarehouseID": 1
          }));
      log(response.body);
      final jsonData = jsonDecode(response.body);
      if (jsonData['StatusCode'] == 6000) {
        allsalesdata = SalesData.fromJson(jsonData);
        return allsalesdata;
      } else {
        log('failed');
        return null;
      }
    } catch (e) {
      log('Error: $e');
    }
    return null;
  }

  Future<SalesData?> filterdata(String Status) async {
    try {
      filteredstatus.value = Status;
      if (allsalesdata != null) {
        List<Sales> filteredData = allsalesdata!.data!.where((element) {
          print('Element status: ${element.status}');
          return element.status == Status;
        }).toList();
        filteredSalesData.value = SalesData(
          statusCode: allsalesdata!.statusCode,
          data: filteredData,
          totalCount: filteredData.length,
        );
        return filteredSalesData.value;
      } else {
        return null;
      }
    } catch (e) {
      log('Error: $e');
    }
    return null;
  }

  Future<SalesData?> searchuser() async {
    try {
      log("Seachred looggg");
      if (allsalesdata != null) {
        List<Sales> filteredData = allsalesdata!.data!.where((element) {
          print('Element status: ${element.customerName}');
          log(searchcontroller.text);
          return element.customerName!
              .toLowerCase()
              .contains(searchcontroller.text.toLowerCase());
        }).toList();

        if (searchcontroller.text.isEmpty) {
          searchsaleslist.value = allsalesdata;
        } else {
          searchsaleslist.value = SalesData(
            statusCode: allsalesdata!.statusCode,
            data: filteredData,
            totalCount: filteredData.length,
          );
        }
        return searchsaleslist.value;
      } else {
        return null;
      }
    } catch (e) {
      log('Error: $e');
      return null;
    }
  }

  Future<Profiledata?> fetchuserprofile() async {
    try {
      final url = Uri.parse(
          'https://www.api.viknbooks.com/api/v10/users/user-view/62/');

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${userdata!.data?.access}',
        },
      );
      log(response.body);
      final jsonData = jsonDecode(response.body);
      if (jsonData['StatusCode'] == 6000) {
        allprofiledata = Profiledata.fromJson(jsonData);
        return allprofiledata;
      } else {
        log('failed');
        return null;
      }
    } catch (e) {
      log('Error: $e');
    }
    return null;
  }
}
