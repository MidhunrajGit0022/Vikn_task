import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Invoices extends StatefulWidget {
  const Invoices({super.key});

  @override
  State<Invoices> createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Color Defaultcolor = const Color(0xFF0E75F4);
    return Scaffold(
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
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 26, 26, 26),
                            filled: true,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey),
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
                              minimumSize: const Size(0, 50),
                              backgroundColor:
                                  const Color.fromARGB(255, 26, 26, 26)),
                          onPressed: () {},
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
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "#Invoice No",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Pending",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Customer Name",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "10,000.00",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
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
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "#Invoice No",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Pending",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Customer Name",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "10,000.00",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
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
                  const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "#Invoice No",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Pending",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Customer Name",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "10,000.00",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
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
                ],
              ),
            ),
          ),
        ));
  }
}
