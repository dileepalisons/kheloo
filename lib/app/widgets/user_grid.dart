import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kheloo/app/data/colors.dart';
import 'package:kheloo/app/data/images.dart';

class UserGrid extends StatefulWidget {
  const UserGrid({
    super.key,
  });

  @override
  State<UserGrid> createState() => _UserGridState();
}

class _UserGridState extends State<UserGrid> {
  final userList = [
    "Aanya",
    "Diya",
    "Ishaanvi",
    "Maya",
    "Priya",
    "Myra",
    "Kiara",
    "Anjali",
    "Zara",
    "Shaina",
    "Arjun",
    "Rohan",
    "Kabir",
    "Dev",
    "Anish",
    "Veer",
    "Aditya",
    "Vivaan",
    "Akash",
    "Rishi",
  ];
  final moneyList = [
    25764,
    35941,
    14064,
    52408,
    58034,
    46561,
    47683,
    40882,
    40987,
    41690,
    37971,
    17816,
    53864,
    48409,
    35881,
    40551,
    54960,
    28971,
    36762,
    50962,
  ];
  final seconds = [
    18,
    3,
    14,
    16,
    19,
    17,
    9,
    12,
    8,
    13,
    0,
    6,
    1,
    10,
    7,
    2,
    5,
    11,
    4,
    15
  ];

  String user = '';
  int money = 0;
  int second = 0;

  @override
  void initState() {
    super.initState();
    changeUserList();
    Timer.periodic(
        const Duration(
          seconds: 2,
        ), (timer) {
      changeUserList();
    });
  }

  changeUserList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 0.8,
          crossAxisSpacing: 10,
        ),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          userList.shuffle();
          user = userList.first;
          moneyList.shuffle();
          money = moneyList.first;
          seconds.shuffle();
          second = seconds.first;
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: AppColors.userBorder,
                      ),
                      borderRadius: BorderRadius.circular(
                        30,
                      )),
                  child: Image.asset(
                    AppImages.user,
                    height: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            user,
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            ' ₹ ',
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              color: AppColors.rupeeSymbolColor,
                            ),
                          ),
                          Text(
                            money.toString(),
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '$second seconds ago',
                        style: GoogleFonts.nunito(
                          fontSize: 10,
                          color: AppColors.halfWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
        });
  }
}
