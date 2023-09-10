import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/cart_controller.dart';
import 'package:myapp/routes/route_helper.dart';
import 'package:myapp/utilities/dimensions.dart';
import 'package:myapp/widgets/account_widget.dart';
import 'package:myapp/widgets/app_icon.dart';
import 'package:myapp/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: BigText(
          text: "Profile",
          size: 24,
        ),
      ),
      body: Container(
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
                          icon: Icons.phone,
                          backgroundColor: Colors.yellow,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24 + 1,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "123456")),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //phone
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email,
                          backgroundColor: Colors.yellow,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24 + 1,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "@email.com")),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //email
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          backgroundColor: Colors.yellow,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24 + 1,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Your location")),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //address
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message_sharp,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24 + 1,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(text: "Messages")),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //message
                    GestureDetector(
                      onTap: () {
                        if (Get.find<AuthController>().userLoggedIn()) {
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
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
      ),
    );
  }
}
