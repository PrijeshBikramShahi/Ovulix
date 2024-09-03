import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/formfield.dart';
import 'package:test_app/utils/fonts.dart';

class LandingPage extends StatelessWidget {
  final imgList = [
    'assets/images/c1.svg',
    'assets/images/c2.svg',
    'assets/images/c3.svg',
    'assets/images/c4.svg',
  ];

  final List<String> sampleNames = [
    'Alice Johnson',
    'Bob Smith',
    'Carol White',
    'David Brown',
    'Eva Green',
    'Frank Harris',
    'Grace Clark',
    'Hank Lewis',
    'Ivy Lee',
    'Jack Wilson',
  ];

  // Function to generate a random number between 1 and 10
  int _generateRandomPeakDays() {
    final Random random = Random();
    return random.nextInt(10) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Color(0xFF6D64FC),
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Text(
          'OVULIX',
          style: Fonts.appbarTitileInverted,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            height: 280,
            color: Color(0xFF6D64FC),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 280,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
              ),
              items: imgList.map((item) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: SvgPicture.asset(
                      item,
                      fit: BoxFit.contain,
                      placeholderBuilder: (BuildContext context) => Container(
                        padding: const EdgeInsets.all(30.0),
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NumericForm(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
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
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0)
                  .copyWith(bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF6D64FC),
                ),
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 173, 167, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: sampleNames.length,
                    itemBuilder: (context, index) {
                      final name = sampleNames[index];
                      final peakDays = _generateRandomPeakDays();
                      return ListTile(
                        title: Text('$name', style: Fonts.titleFont),
                        subtitle: Text('Number of fertility peak days: $peakDays', style: Fonts.onboardSubtitle),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
