import 'package:flutter/material.dart';
import 'package:test_app/utils/fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageOne extends StatelessWidget {
  final VoidCallback ontap;
  const PageOne({super.key, required this.ontap});
  // String assetName = 'assets/images/on1.svg';
  // final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Acme Logo');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Container(
            height: 55,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://shorturl.at/aGPU4"),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            child: SvgPicture.asset("./assets/images/i2.svg",
                semanticsLabel: 'Acme Logo'),
            height: 350,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              "Welcome to Ovulix",
              style: Fonts.onboardTitleInverted,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            child: Text(
              "A Dependable Fertility Prediction App",
              style: Fonts.onboardSubtitleInverted,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          GestureDetector(
            onTap: ontap,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              height: 50,
              width: 150,
              child: const Center(
                  child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  PageTwo({super.key, required this.ontap});
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Container(
            height: 60,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://shorturl.at/aGPU4"),
              ),
            ),
          ),
          SizedBox(
            child: SvgPicture.asset("./assets/images/i1.svg",
                semanticsLabel: 'Acme Logo'),
            height: 350,
          ),
          Container(
            child: Text(
              "Track your cycles",
              style: Fonts.onboardTitleInverted,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            child: Text(
              "Conveniently track your menstrual cycles",
              style: Fonts.onboardSubtitleInverted,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 115,
          ),
          GestureDetector(
            onTap: ontap,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              height: 50,
              width: 150,
              child: const Center(
                  child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  PageThree({super.key, required this.ontap});
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Container(
            height: 60,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://shorturl.at/aGPU4"),
              ),
            ),
          ),
          SizedBox(
            child: SvgPicture.asset("./assets/images/i3.svg",
                semanticsLabel: 'Acme Logo'),
            height: 350,
          ),
          Container(
            child: Text(
              "Get Started with Ovulix",
              style: Fonts.onboardTitleInverted,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            child: Text(
              "Keep track of fertility",
              style: Fonts.onboardSubtitleInverted,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 110,
          ),
          GestureDetector(
            onTap: ontap,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              height: 50,
              width: 250,
              child: const Center(
                  child: Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
