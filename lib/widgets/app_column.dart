import 'package:flutter/material.dart';
import 'package:myapp/widgets/small_text.dart';
import '../utilities/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            Smalltext(text: "4.5"),
            SizedBox(
              width: Dimensions.width10,
            ),
            Smalltext(text: "1287"),
            SizedBox(
              width: Dimensions.width10,
            ),
            Smalltext(text: "Comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: Colors.orangeAccent),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: Colors.redAccent),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: Colors.black),
          ],
        )
      ],
    );
  }
}
