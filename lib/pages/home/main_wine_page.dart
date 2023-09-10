import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/popular_product_controller.dart';
import 'package:myapp/controllers/recommended_product_controller.dart';
import 'package:myapp/pages/home/wine_page_body.dart';
import 'package:myapp/utilities/dimensions.dart';
import 'package:myapp/widgets/big_text.dart';

class MainWinePage extends StatefulWidget {
  const MainWinePage({super.key});

  @override
  State<MainWinePage> createState() => _MainWinePageState();
}

Future<void> _loadResource() async {
  await Get.find<PopularProductController>().getPopularProductList();
  await Get.find<RecommendedProductController>().getRecommendedProductList();
}

class _MainWinePageState extends State<MainWinePage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Column(
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.top45, bottom: Dimensions.bottom15),
                padding: EdgeInsets.only(
                    left: Dimensions.left20, right: Dimensions.right20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "WineHouse",
                          color: Colors.red[700],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: const Color.fromRGBO(231, 76, 60, 1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: WinePageBody(),
            )),
          ],
        ),
        onRefresh: _loadResource);
  }
}
