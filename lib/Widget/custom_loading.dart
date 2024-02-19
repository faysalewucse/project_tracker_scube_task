import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scube_project_tracker/Helper/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  final Color? color;
  final double? size;
  const CustomLoader({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      size: size ?? 50.0,
      color: color ?? PRIMARY_COLOR,
    );
  }
}
