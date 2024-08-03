import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task/api/api_controller.dart';
import 'package:vikn_task/model/sales_model.dart';
import 'package:vikn_task/pages/filter.dart';

class Invoices_page extends StatefulWidget {
  const Invoices_page({super.key});

  @override
  State<Invoices_page> createState() => _Invoices_pageState();
}

class _Invoices_pageState extends State<Invoices_page> {
  final apicontroller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Color Defaultcolor = const Color(0xFF0E75F4);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.01,
                        ),
                        const Text(
                          "Invoices",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    const Divider(
                      color: Color(0xFF1C3347),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: apicontroller.searchcontroller,
                            onChanged: (value) {
                              apicontroller.searchuser();
                            },
                            cursorColor: Colors.white,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              fillColor: Color.fromARGB(255, 26, 26, 26),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(117, 158, 158, 158)),
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.02,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 55),
                                backgroundColor:
                                    const Color.fromARGB(255, 26, 26, 26)),
                            onPressed: () {
                              log("WOrk");
                              Get.to(() => const Filter_page());
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.filter_list_outlined,
                                  color: Defaultcolor,
                                ),
                                const Text(" Add Filters"),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    const Divider(
                      color: Color(0xFF1C3347),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Column(
                      children: [
                        Obx(
                          () {
                            if (apicontroller
                                .searchcontroller.text.isNotEmpty) {
                              apicontroller.searchuser();
                            }
                            if (apicontroller.searchsaleslist.value == null ||
                                apicontroller.searchsaleslist.value!.data ==
                                    null) {
                              if (apicontroller.searchcontroller.text.isEmpty) {
                                return const SizedBox();
                              } else {
                                return const SizedBox(
                                  child: Text(
                                    "Searching",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }
                            }
                            return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: apicontroller
                                  .searchsaleslist.value!.data!.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "#Invoice No ${apicontroller.searchsaleslist.value!.data![index].index.toString()}",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            apicontroller.searchsaleslist.value!
                                                        .data![index].status ==
                                                    'Invoiced'
                                                ? Text(
                                                    apicontroller
                                                        .searchsaleslist
                                                        .value!
                                                        .data![index]
                                                        .status
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.blue),
                                                  )
                                                : Text(
                                                    apicontroller
                                                        .searchsaleslist
                                                        .value!
                                                        .data![index]
                                                        .status
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: Colors.grey)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              apicontroller
                                                  .searchsaleslist
                                                  .value!
                                                  .data![index]
                                                  .customerName
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              apicontroller
                                                  .searchsaleslist
                                                  .value!
                                                  .data![index]
                                                  .grandTotal
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenSize.height * 0.01,
                                    ),
                                    const Divider(
                                      color: Color(0xFF1C3347),
                                    ),
                                    SizedBox(
                                      height: screenSize.height * 0.01,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        Obx(
                          () {
                            return apicontroller.searchsaleslist.value != null
                                ? const SizedBox()
                                : SizedBox(
                                    height: screenSize.height,
                                    child: FutureBuilder(
                                      future: apicontroller.saleslist(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          SalesData? salesData = snapshot.data;
                                          if (salesData != null &&
                                              salesData.data != null) {
                                            return ListView.builder(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: salesData.data!.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "#Invoice No ${salesData.data![index].index.toString()}",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            if (salesData
                                                                    .data![
                                                                        index]
                                                                    .status ==
                                                                'Invoiced')
                                                              Text(
                                                                  salesData.data![index].status
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .blue))
                                                            else if (salesData
                                                                    .data![
                                                                        index]
                                                                    .status ==
                                                                'Pending')
                                                              Text(
                                                                  salesData
                                                                      .data![
                                                                          index]
                                                                      .status
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .red))
                                                            else
                                                              Text(
                                                                  salesData
                                                                      .data![index]
                                                                      .status
                                                                      .toString(),
                                                                  style: const TextStyle(color: Colors.grey))
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              salesData
                                                                  .data![index]
                                                                  .customerName
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              salesData
                                                                  .data![index]
                                                                  .grandTotal
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          screenSize.height *
                                                              0.01,
                                                    ),
                                                    const Divider(
                                                      color: Color(0xFF1C3347),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          screenSize.height *
                                                              0.01,
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else {
                                            return const Center(
                                              child: Text("No data available"),
                                            );
                                          }
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      },
                                    ),
                                  );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
