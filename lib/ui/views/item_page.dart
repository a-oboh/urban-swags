import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:urban_attires/config/margins.dart';
import 'package:urban_attires/config/size_config.dart';
import 'package:urban_attires/ui/shared/my_colors.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Container(
        // width: SizeConfig.width(context, 100),
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: SizeConfig.width(context, 3),
              right: SizeConfig.width(context, 3),
              top: SizeConfig.height(context, 2.5),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesome5.arrow_left,
                          size: SizeConfig.textSize(context, 5),
                          color: UrbanAttireColors.darkGrey,
                        ),
                        Xmargin(
                          width: 2,
                        ),
                        Text(
                          'back',
                          style: textTheme.bodyText1.copyWith(
                            color: UrbanAttireColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Filter',
                          style: textTheme.bodyText1.copyWith(
                            color: UrbanAttireColors.darkGrey,
                          ),
                        ),
                        Xmargin(
                          width: 2,
                        ),
                        Icon(
                          Icons.filter_list,
                          size: SizeConfig.textSize(context, 7),
                          color: UrbanAttireColors.darkGrey,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
