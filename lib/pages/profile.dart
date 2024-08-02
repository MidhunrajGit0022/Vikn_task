import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_task/pages/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.04,
                  ),
                  Container(
                    width: screenSize.width,
                    height: screenSize.height / 3,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 29, 29, 29),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.black,
                                ),
                                child: Image.asset(
                                  './assets/person.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.02,
                              ),
                              SizedBox(
                                width: screenSize.width * 0.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Midhun Raj",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "midhunraj0022@gmail.com",
                                      style: TextStyle(
                                          color: Colors.lightBlue[100],
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.02,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit_square,
                                        color: Colors.white,
                                      ))
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      color: const Color(0xFF0F0F0F),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: screenSize.width * 0.02,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.blue.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: screenSize.height * 0.08,
                                            width: screenSize.width * 0.08,
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [Icon(Icons.share)],
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "4.3 *",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            const Text(
                                              "2,211",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              "rides",
                                              style: TextStyle(
                                                  color: Colors.lightBlue[100],
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      color: const Color(0xFF0F0F0F),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: screenSize.width * 0.02,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: screenSize.height * 0.08,
                                            width: screenSize.width * 0.08,
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.verified_user_sharp)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Row(
                                              children: [
                                                Text(
                                                  "KYC ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors.white,
                                                  size: 12,
                                                )
                                              ],
                                            ),
                                            Text(
                                              "verified",
                                              style: TextStyle(
                                                  color: Colors.lightBlue[100],
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.off(const Loginscreen());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 40),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.logout,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        " Logout",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.help_outline,
                                      color: Colors.blue[200],
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 0.03,
                                    ),
                                    const Text(
                                      "Help",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.manage_search_outlined,
                                      color: Colors.blue[200],
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 0.03,
                                    ),
                                    const Text(
                                      "FAQ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person_add_alt,
                                      color: Colors.blue[200],
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 0.03,
                                    ),
                                    const Text(
                                      "Invite friends",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.policy_outlined,
                                      color: Colors.blue[200],
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 0.03,
                                    ),
                                    const Text(
                                      "Terms of Service",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.privacy_tip_outlined,
                                      color: Colors.blue[200],
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 0.03,
                                    ),
                                    const Text(
                                      "Privacy Policy",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
