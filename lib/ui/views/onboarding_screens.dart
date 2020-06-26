import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urban_attires/routes/router.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  ScreenUtil screenUtil = ScreenUtil();

  TextTheme textTheme;

  int currentPageIndex = 0;
  int currentbgIndex = 0;

  PageController textPageController = PageController();
  PageController bgPageController = PageController();

  Duration pageDuration = Duration(milliseconds: 700);

  Curve pageCurve = Curves.easeInOut;

  static var storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
  }

  onNext() {
    if (currentPageIndex == 1) {
      return null;
    }

    bgPageController.animateToPage(currentbgIndex + 1,
        duration: Duration(milliseconds: 600), curve: pageCurve);

    textPageController.animateToPage(currentPageIndex + 1,
        duration: pageDuration, curve: pageCurve);

    setState(() {
      currentbgIndex = currentbgIndex + 1;
      currentPageIndex = currentPageIndex + 1;
    });
  }

  onBack() {
    if (currentPageIndex == 0) {
      return null;
    }

    bgPageController.animateToPage(currentbgIndex - 1,
        duration: Duration(milliseconds: 600), curve: pageCurve);

    textPageController.animateToPage(currentPageIndex - 1,
        duration: pageDuration, curve: pageCurve);

    setState(() {
      currentbgIndex = currentbgIndex - 1;
      currentPageIndex = currentPageIndex - 1;
    });
  }

  onDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('onboard', true);

    Navigator.pushReplacementNamed(context, homeRoute);
  }

  double leftPosition() {
    if (currentPageIndex == 0) {}
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: bgPageController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              firstBackground(context),
              secondBackground(context),
            ],
          ),
          AnimatedPositioned(
            left: currentPageIndex == 0
                ? screenUtil.setWidth(-15)
                : screenUtil.setWidth(600),
            duration: pageDuration,
            child: Container(
              height: screenUtil.setHeight(570),
              width: screenUtil.setWidth(470),
              child: Image.asset('assets/img/illustration_1.png'),
            ),
          ),
          AnimatedPositioned(
            left: currentPageIndex == 1
                ? screenUtil.setWidth(70)
                : screenUtil.setWidth(600),
            duration: pageDuration,
            child: Container(
              height: screenUtil.setHeight(650),
              width: screenUtil.setWidth(300),
              child: Image.asset(
                'assets/img/illustration_2.png',
              ),
            ),
          ),
          Container(
            child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: textPageController,
                children: <Widget>[
                  firstTextSlide(),
                  secondTextSlide(),
                ]),
          ),
          AnimatedPositioned(
            bottom: 0,
            left: currentPageIndex == 0 ? 0 : screenUtil.setWidth(-600),
            duration: pageDuration,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    onNext();
                  },
                  child: Container(
                    width: screenUtil.setWidth(90),
                    height: screenUtil.setHeight(50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                      color: Color(0xff0027AA),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: textTheme.bodyText1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenUtil.setWidth(250),
                ),
                InkWell(
                  onTap: () {
                    onDone();
                  },
                  child: Text(
                    'Skip',
                    style: textTheme.bodyText1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            bottom: 0,
            right: currentPageIndex == 1 ? 0 : screenUtil.setWidth(-400),
            duration: pageDuration,
            child: InkWell(
              onTap: () {
                onDone();
              },
              child: Container(
                width: screenUtil.setWidth(120),
                height: screenUtil.setHeight(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                  color: Color(0xff0027AA),
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: textTheme.bodyText1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget firstBackground(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/img/onboarding_background_1.png'),
        ),
      ),
    );
  }

  Widget secondBackground(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/img/onboarding_background_2.png'),
        ),
      ),
    );
  }

  Widget firstTextSlide() {
    textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(
        top: screenUtil.setHeight(420),
        left: screenUtil.setWidth(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: screenUtil.setWidth(151),
            child: Text(
              'Awesome fashion trends',
              style: textTheme.headline4.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: screenUtil.setSp(32),
              ),
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(14),
          ),
          Container(
            width: screenUtil.setWidth(193),
            child: Text(
              'Be updated with fashion trends, stay on top of your game.',
              style: textTheme.bodyText1.copyWith(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: screenUtil.setSp(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget secondTextSlide() {
    textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(
        top: screenUtil.setHeight(420),
        left: screenUtil.setWidth(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: screenUtil.setWidth(167),
            child: Text(
              'Unlock your inner fashionista',
              style: textTheme.headline4.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: screenUtil.setSp(32),
              ),
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(14),
          ),
          Container(
            width: screenUtil.setWidth(193),
            child: Text(
              'Endless swag and drip for you every single day.',
              style: textTheme.bodyText1.copyWith(
                color: Colors.white,
                // fontWeight: FontWeight.bold,
                fontSize: screenUtil.setSp(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
