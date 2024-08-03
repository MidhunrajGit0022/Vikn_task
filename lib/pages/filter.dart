import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vikn_task/api/api_controller.dart';

class Filter_page extends StatefulWidget {
  const Filter_page({super.key});

  @override
  State<Filter_page> createState() => _Filter_pageState();
}

class _Filter_pageState extends State<Filter_page> {
  final ApiController _apiController = ApiController.instance;
  String _selectedMonth = DateFormat('MMMM').format(DateTime.now());
  DateTime _selectedDate = DateTime.now();
  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    _apiController.filterdata('Pending');

    super.initState();
  }

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          "Filters",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.visibility,
                          color: Defaultcolor,
                        ),
                        SizedBox(
                          width: screenSize.width * 0.04,
                        ),
                        Text(
                          "Filter",
                          style: TextStyle(
                            color: Defaultcolor,
                            fontSize: 18,
                          ),
                        )
                      ],
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
                Column(
                  children: [
                    Center(
                        child: Container(
                      width: 130,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Color(0xFF08131E),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: DropdownButton(
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        isExpanded: true,
                        underline: Container(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                        value: _selectedMonth,
                        onChanged: (value) {
                          setState(() {
                            _selectedMonth = value!;
                          });
                        },
                        items: _months.map((month) {
                          return DropdownMenuItem(
                            value: month,
                            child: Text(
                              month,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        dropdownColor: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        alignment: Alignment.center,
                        elevation: 2,
                        padding: const EdgeInsets.all(5),
                      ),
                    )),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color.fromARGB(255, 26, 26, 26)),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () => _selectDate(context),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Defaultcolor,
                                ),
                                Text(
                                  '  ${_selectedDate.toString().split(' ').first}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color.fromARGB(255, 26, 26, 26)),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () => _selectDate(context),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Defaultcolor,
                                ),
                                Text(
                                  ' ${_selectedDate.toString().split(' ').first}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
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
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(120, 40),
                                backgroundColor:
                                    _apiController.filteredstatus.value ==
                                            'Pending'
                                        ? Defaultcolor
                                        : const Color.fromARGB(255, 26, 26, 26),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                _apiController.filterdata('Pending');
                              },
                              child: const Text("Pending"),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(120, 40),
                                backgroundColor:
                                    _apiController.filteredstatus.value ==
                                            'Invoiced'
                                        ? Defaultcolor
                                        : const Color.fromARGB(255, 26, 26, 26),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                _apiController.filterdata('Invoiced');
                              },
                              child: const Text("Invoiced"),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(120, 40),
                                backgroundColor:
                                    _apiController.filteredstatus.value ==
                                            'Cancelled'
                                        ? Defaultcolor
                                        : const Color.fromARGB(255, 26, 26, 26),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                _apiController.filterdata('Cancelled');
                              },
                              child: const Text("Cancelled"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: screenSize.width * 1,
                        height: screenSize.height * 0.06,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF08131E),
                            ),
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Customers",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined)
                              ],
                            )),
                      ),
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
                    SizedBox(
                      width: screenSize.width,
                      child: Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: (_apiController
                                      .filteredSalesData.value!.data!.length /
                                  3)
                              .ceil(),
                          itemBuilder: (context, index) {
                            return ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: screenSize.width),
                              child: Row(
                                children: List.generate(
                                  3,
                                  (index2) {
                                    int itemIndex = index * 3 + index2;
                                    if (itemIndex <
                                        _apiController.filteredSalesData.value!
                                            .data!.length) {
                                      return Flexible(
                                        child: listofsearch(
                                          screenSize,
                                          Defaultcolor,
                                          _apiController
                                              .filteredSalesData
                                              .value!
                                              .data![itemIndex]
                                              .customerName
                                              .toString(),
                                        ),
                                      );
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column listofsearch(Size screenSize, Color Defaultcolor, String salesData) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: screenSize.width * 0.3,
            height: screenSize.height * 0.05,
            decoration: const BoxDecoration(
                color: Color.fromARGB(
                  255,
                  26,
                  26,
                  26,
                ),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(
                        salesData,
                        style: const TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.close,
                      color: Defaultcolor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenSize.height * 0.001,
        ),
      ],
    );
  }
}
