import 'package:flutter/material.dart';
import 'package:urban_attires/config/size_config.dart';

class Xmargin extends StatelessWidget {
  const Xmargin({
    this.width = 0,
  }) : assert(width != null, 'X margin width must nut be null');

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width(context, width),
    );
  }
}

class Ymargin extends StatelessWidget {
  const Ymargin({
    this.height = 0,
  }) : assert(height != null, 'Y margin height must nut be null');

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.width(context, height),
    );
  }
}
