import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/cart_controller.dart';
import 'package:myapp/controllers/location_controller.dart';
import 'package:myapp/controllers/popular_product_controller.dart';
import 'package:myapp/controllers/recommended_product_controller.dart';
import 'package:myapp/controllers/user_controller.dart';
import 'package:myapp/data/api/api_client.dart';
import 'package:myapp/data/repository/auth_repo.dart';
import 'package:myapp/data/repository/cart_repo.dart';
import 'package:myapp/data/repository/location_repo.dart';
import 'package:myapp/data/repository/popular_product_repo.dart';
import 'package:myapp/data/repository/recommended_product_repo.dart';
import 'package:myapp/data/repository/user_repo.dart';
import 'package:myapp/utilities/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstant.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
}
