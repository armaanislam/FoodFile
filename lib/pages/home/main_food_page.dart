import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodfile/pages/home/food_page_body.dart';
import 'package:foodfile/utils/colors.dart';
import 'package:foodfile/utils/dimensions.dart';
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
                  margin: EdgeInsets.only(
                      top: Dimensions.height35, bottom: Dimensions.height15),
                  padding: EdgeInsets.only(
                      left: Dimensions.width10, right: Dimensions.width10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(
                              text: "Bangladesh", color: AppColors.mainColor),
                          Row(
                            children: [
                              SmallText(
                                  text: "Narshingdi", color: Colors.black54),
                              Icon(Icons.arrow_drop_down_rounded)
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        child: Icon(Icons.search,
                            color: Colors.white, size: Dimensions.iconSize24),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
