import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/base/custom_loader.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/cart_controller.dart';
import 'package:myapp/controllers/user_controller.dart';
import 'package:myapp/routes/route_helper.dart';
import 'package:myapp/utilities/dimensions.dart';
import 'package:myapp/widgets/account_widget.dart';
import 'package:myapp/widgets/app_icon.dart';
import 'package:myapp/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      print("User login ");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: BigText(
          text: "Profile",
          size: 24,
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        return _userLoggedIn
            ? (userController.isLoading
                ? Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: Dimensions.height20),
                    child: Column(
                      children: [
                        //profile icon
                        AppIcon(
                          icon: Icons.person,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height45 + Dimensions.height30,
                          size: Dimensions.bg150,
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                //name
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: Colors.yellow,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.iconSize24 + 1,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.name)),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //phone
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: Colors.yellow,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.iconSize24 + 1,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.phone)),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //email
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: Colors.yellow,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.iconSize24 + 1,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.email)),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //address
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.iconSize24 + 1,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(text: "Your location ")),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //message
                                AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.message_outlined,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.iconSize24 + 1,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(text: "Messages")),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                //logout
                                GestureDetector(
                                  onTap: () {
                                    if (Get.find<AuthController>()
                                        .userLoggedIn()) {
                                      Get.find<AuthController>()
                                          .clearSharedData();
                                      Get.find<CartController>().clear();
                                      Get.find<CartController>()
                                          .clearCartHistory();
                                      Get.offNamed(RouteHelper.getSignInPage());
                                    } else {
                                      print("you logged out");
                                    }
                                  },
                                  child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon: Icons.logout,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimensions.iconSize24 + 1,
                                        size: Dimensions.height10 * 5,
                                      ),
                                      bigText: BigText(text: "Logout")),
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : const CustomLoader())
            : Container(
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 8,
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/image/logo2.png"))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getSignInPage());
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 5,
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            child: Center(
                                child: BigText(
                              text: "Sign in",
                              color: Colors.white,
                              size: Dimensions.font26,
                            )),
                          ),
                        )
                      ]),
                ),
              );
      }),
    );
  }
}
