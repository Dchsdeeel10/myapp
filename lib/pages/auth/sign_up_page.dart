import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/base/custom_loader.dart';
import 'package:myapp/base/show_custom_snackbar.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/models/signup_body_model.dart';
import 'package:myapp/utilities/dimensions.dart';
import 'package:myapp/widgets/app_text_field.dart';
import 'package:myapp/widgets/big_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailControlller = TextEditingController();
    var passwordControlller = TextEditingController();
    var nameControlller = TextEditingController();
    var phoneControlller = TextEditingController();
    var signUpImages = ["t.png", "f.png", "g.png"];

    void _registration(AuthController authController) {
      String name = nameControlller.text.trim();
      String phone = phoneControlller.text.trim();
      String email = emailControlller.text.trim();
      String password = passwordControlller.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Please enter your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Please enter your phone number",
            title: "Phone Number");
      } else if (email.isEmpty) {
        showCustomSnackBar("Please enter your email address", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Please enter your valid email address",
            title: "Email Address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Please enter your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password cannot be less than six characters",
            title: "Password");
      } else {
        SignUpBody signUpBody = SignUpBody(
            name: name, phone: phone, email: email, password: password);
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("Success registration");
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(
          builder: (_authController) {
            return !_authController.isLoading
                ? SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Dimensions.screenHeight * 0.03,
                        ),
                        Container(
                          height: Dimensions.screenHeight * 0.25,
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: Dimensions.radius20 * 5,
                              backgroundImage: AssetImage(
                                "assets/image/logo.png",
                              ),
                            ),
                          ),
                        ),
                        AppTextField(
                            textController: emailControlller,
                            hintText: "Email",
                            icon: Icons.email),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        AppTextField(
                          textController: passwordControlller,
                          hintText: "Password",
                          icon: Icons.password_sharp,
                          isObscure: true,
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        AppTextField(
                            textController: nameControlller,
                            hintText: "Name",
                            icon: Icons.person),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        AppTextField(
                            textController: phoneControlller,
                            hintText: "Phone",
                            icon: Icons.phone),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        GestureDetector(
                          onTap: () {
                            _registration(_authController);
                          },
                          child: Container(
                            width: Dimensions.screenWidth / 2,
                            height: Dimensions.screenHeight / 13,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius30),
                                color: Colors.redAccent),
                            child: Center(
                              child: BigText(
                                text: "Sign up",
                                size: Dimensions.font20 + Dimensions.font20 / 2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        RichText(
                            text: TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.back(),
                                text: "Have an Account already?",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.font15))),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.05,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Sing up using one of following methods",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.font15))),
                        Wrap(
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: Dimensions.radius20,
                                      backgroundImage: AssetImage(
                                        "assets/image/" + signUpImages[index],
                                      ),
                                    ),
                                  )),
                        )
                      ],
                    ),
                  )
                : const CustomLoader();
          },
        ));
  }
}
