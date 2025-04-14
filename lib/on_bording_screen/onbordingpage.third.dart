import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../LoginPage.dart';

class onbordingpagethird extends StatelessWidget {
  String image;
  String title1;
  String title2;
  String title3;
  final PageController next;
  onbordingpagethird(
      this.title1, this.title2, this.title3, this.image, this.next);
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 260,
            color: Colors.white.withOpacity(0.6),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title1,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title2,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Text(
                      title3,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Positioned(
                    child: SmoothPageIndicator(
                  controller: next,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotHeight: 15,
                      dotWidth: 15,
                      activeDotColor: Colors.indigoAccent,
                      dotColor: Colors.black26),
                )),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigoAccent,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.only(left: 60, right: 60)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Get Started",
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
