import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodfile/data/controller/popular_product_controller.dart';
import 'package:foodfile/utils/app_constants.dart';
import 'package:foodfile/utils/colors.dart';
import 'package:foodfile/utils/dimensions.dart';
import 'package:foodfile/widgets/big_text.dart';
import 'package:foodfile/widgets/icon_and_text.dart';
import 'package:get/get.dart';

import '../../models/popular_product_model.dart';
import '../../widgets/app_column.dart';
import '../../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("Current height is " + MediaQuery.of(context).size.height.toString());
    return Column(
      children: [
        // Slider section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded? Container(
            // color: Colors.redAccent,
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.length,
                itemBuilder: (context, position) {
                  return _buildPageItem(position, popularProducts.popularProductList[position]);
                }),
          ) : const CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
        // Dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty ? 1 : popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeColor: AppColors.mainColor,
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        // Popular texts
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            // Everything comes at bottom
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: "Food pairing")),
            ],
          ),
        ),
        // Lists of food and images
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width10,
                    right: Dimensions.width10,
                    bottom: Dimensions.height10),
                child: Row(
                  children: [
                    Container(
                      width: Dimensions.listViewImgSize,
                      height: Dimensions.listViewImgSize,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white38,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/food6.jpg")),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 80,
                        // width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight:
                                  Radius.circular(Dimensions.radius20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(
                                  text: "Nutritious fruit meal in china",
                                  size: Dimensions.font15),
                              SizedBox(height: Dimensions.height10),
                              SmallText(text: "With chinese characteristics"),
                              SizedBox(height: Dimensions.height10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  IconAndTextWidget(
                                      icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: AppColors.iconColor1),
                                  IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: "1.7km",
                                      iconColor: AppColors.mainColor),
                                  IconAndTextWidget(
                                      icon: Icons.access_time_rounded,
                                      text: "32min",
                                      iconColor: AppColors.iconColor2)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          // Showing the header
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? const Color(0xFF69c5Df) : const Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${AppConstants.BASE_URL}/uploads/${popularProduct.img!}'
                    ),
                ),
            ),
          ),
          // Showing the body
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    left: Dimensions.width15,
                    right: Dimensions.width15),
                child: AppColumn(text: popularProduct.name!),
              ),
            ),
          )
        ],
      ),
    );
  }
}
