import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/controllers/cart_controller.dart';
import 'package:myapp/controllers/popular_product_controller.dart';
import 'package:myapp/controllers/recommended_product_controller.dart';
import 'package:myapp/pages/auth/sign_in_page.dart';
import 'package:myapp/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(builder: (_) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'WineHouse',
            //home: SignInPage(),
            //home: SplashScreen(),
            initialRoute: RouteHelper.getSpashPage(),
            getPages: RouteHelper.routes,
          );
        });
      },
    );
  }
}
