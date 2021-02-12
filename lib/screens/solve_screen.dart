import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sudoku_solver/widgets/horizontal_layout.dart';
import 'package:sudoku_solver/widgets/vertical_layout.dart';

class SolveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // If the width is greater than 400px the phone can rotate
    var _shortestSide = MediaQuery.of(context).size.width;
    print(_shortestSide);
    var _canRotate = _shortestSide > 400;
    if (_canRotate == false) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return VerticalLayout();
            } else {
              return HorizontalLayout();
            }
          },
        ),
      ),
    );
  }
}
