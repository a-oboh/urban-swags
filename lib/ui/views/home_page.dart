import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:urban_attires/routes/router.dart';
import 'package:urban_attires/ui/shared/my_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScreenUtil screenUtil = ScreenUtil();

  TextTheme textTheme;

  @override
  void initState() {
    super.initState();
    changeStatusColor(UrbanAttireColors.yellow);
  }

  changeStatusColor(Color color) async {
    try {
      await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
      if (useWhiteForeground(color)) {
        FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
      } else {
        FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: screenUtil.setWidth(17),
          right: screenUtil.setWidth(17),
          top: screenUtil.setHeight(45),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello, good morning!',
                style: textTheme.headline5.copyWith(
                  fontWeight: FontWeight.w900,
                  color: UrbanAttireColors.darkGrey,
                  // fontSize:
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(8),
              ),
              Text(
                'Checkout attires today :smile:',
                style: textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.w300,
                  color: UrbanAttireColors.darkGrey,
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(30),
              ),
              StyleCard(
                cardColor: Color(0xffFFD832),
                textColor: UrbanAttireColors.darkGrey,
                title: 'Ankara Styles',
                caption: 'Images of the latest trending ankara styles',
                assetImage: Padding(
                  padding: EdgeInsets.only(left: screenUtil.setWidth(40)),
                  child: Image.asset('assets/img/ankara_style.png'),
                ),
                rightDirection: true,
                onTap: () {
                  Navigator.pushNamed(context, itemPageRoute);
                },
              ),
              SizedBox(
                height: screenUtil.setHeight(10),
              ),
              StyleCard(
                cardColor: Color(0xff00962E),
                textColor: Colors.white,
                title: 'Mum & Daughter',
                caption:
                    'Images of the latest trending mother and daughter to match',
                assetImage: Padding(
                  padding: EdgeInsets.only(right: screenUtil.setWidth(40)),
                  child: Image.asset('assets/img/mom_and_child.png'),
                ),
                rightDirection: false,
              ),
              SizedBox(
                height: screenUtil.setHeight(10),
              ),
              StyleCard(
                cardColor: Color(0xffCC5D81),
                textColor: Colors.white,
                title: 'Casual Wears',
                caption:
                    'Images of the latest trending casual wear combinations',
                assetImage: Padding(
                  padding: EdgeInsets.only(left: screenUtil.setWidth(40)),
                  child: Image.asset('assets/img/casual_wears.png'),
                ),
                rightDirection: true,
              ),
              SizedBox(
                height: screenUtil.setHeight(10),
              ),
              StyleCard(
                cardColor: Color(0xff4771FF),
                textColor: Colors.white,
                title: 'Office Wears',
                caption:
                    'Images of the latest trending office wears combinations',
                assetImage: Padding(
                  padding: EdgeInsets.only(right: screenUtil.setWidth(50)),
                  child: Image.asset('assets/img/office_wears.png'),
                ),
                rightDirection: false,
              ),
              SizedBox(
                height: screenUtil.setHeight(10),
              ),
              StyleCard(
                cardColor: Color(0xffb1003a),
                textColor: Colors.white,
                title: 'Female child & Teenager',
                caption:
                    'Images of the latest trending designs for children and teenagers',
                assetImage: Padding(
                  padding: EdgeInsets.only(left: screenUtil.setWidth(20)),
                  child: Image.asset('assets/img/teenage_wears.png'),
                ),
                rightDirection: true,
              ),
              SizedBox(
                height: screenUtil.setHeight(10),
              ),
              StyleCard(
                cardColor: UrbanAttireColors.yellow,
                textColor: UrbanAttireColors.darkGrey,
                title: 'Lace Styles',
                caption:
                    'Images of the latest trending designs for lace materials',
                assetImage: Padding(
                  padding: EdgeInsets.only(right: screenUtil.setWidth(50)),
                  child: Image.asset('assets/img/lace_wears.png'),
                ),
                rightDirection: false,
              ),
              SizedBox(
                height: screenUtil.setHeight(15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StyleCard extends StatelessWidget {
  StyleCard({
    Key key,
    @required this.cardColor,
    @required this.textColor,
    @required this.title,
    @required this.caption,
    @required this.rightDirection,
    @required this.assetImage,
    this.onTap,
  }) : super(key: key);

  final Color cardColor;
  final Color textColor;
  final String title;
  final String caption;
  final bool rightDirection;
  final Widget assetImage;
  final Function onTap;

  TextTheme textTheme;

  ScreenUtil screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    if (rightDirection) {
      return InkWell(
        onTap: onTap != null
            ? () {
                onTap();
              }
            : () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(20)),
          height: screenUtil.setHeight(130),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: screenUtil.setHeight(34)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: textTheme.bodyText1.copyWith(
                        fontSize: screenUtil.setSp(16),
                        color: textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    Container(
                      width: screenUtil.setWidth(170),
                      child: Text(
                        caption,
                        style: textTheme.caption.copyWith(
                          color: textColor,
                          fontSize: screenUtil.setSp(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              assetImage,
            ],
          ),
        ),
      );
    }

    return InkWell(
      onTap: onTap != null
          ? () {
              onTap();
            }
          : () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(20)),
        height: screenUtil.setHeight(130),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: <Widget>[
            assetImage,
            Padding(
              padding: EdgeInsets.only(top: screenUtil.setHeight(34)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: textTheme.bodyText1.copyWith(
                      fontSize: screenUtil.setSp(16),
                      color: textColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(8),
                  ),
                  Container(
                    width: screenUtil.setWidth(170),
                    child: Text(
                      caption,
                      style: textTheme.caption.copyWith(
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
