import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter/material.dart';

void main() {
  /// Comment or uncomment to run both examples
  runApp(
    Example3dChoiceChip(),
    //WithPages()
  );
}

class Example3dChoiceChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      child: Row(
        children: [
          ChoiceChip3D(
            style: ChoiceChip3DStyle.blue,
            onSelected: (bool) {},
            selected: true,
            child: Text("Choice One"),
          ),
          ChoiceChip3D(
            style: ChoiceChip3DStyle.blue,
            onSelected: (bool) {},
            selected: false,
            child: Text("Choice Two"),
          )
        ],
      ),
    )));
  }
}
