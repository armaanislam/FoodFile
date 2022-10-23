import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodfile/utils/colors.dart';
import 'package:foodfile/widgets/big_text.dart';
import 'package:foodfile/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              child: Container(
                  margin: EdgeInsets.only(top: 35, bottom: 15),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(text: "Bangladesh", color: AppColors.mainColor),
                          Row(
                            children: [
                              SmallText(text: "Narshingdi", color: Colors.black54),
                              Icon(Icons.arrow_drop_down_rounded)
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        child: Icon(Icons.search, color: Colors.white),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
