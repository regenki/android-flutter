import 'package:flutter/material.dart';
import 'package:regenki/Shared/Theme.dart';

class OnBoardingViewPage extends StatelessWidget {
  const OnBoardingViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                height: 360,
                child: Image.network(
                    "https://static.wikia.nocookie.net/bandori/images/e/e5/Pessimistic_Girl_Live2D_Model.png/revision/latest/scale-to-width-down/666?cb=20200315175650"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24, bottom: 4),
              child: Text(
                "Self Care",
                style: poppinstextColor.copyWith(
                    fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "managing activities is an important thing that needs to be done because it really helps in prioritizing yourself",
                style: poppinstextColor.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){},
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.08,
                margin: EdgeInsets.only(bottom: 32, left: 64, right: 64),
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12)),
                child:Center(
                  child: Text(
                    "Get Started",
                    style: poppinsPrimary.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ) ,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
