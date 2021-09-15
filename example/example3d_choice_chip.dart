import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    Example3dChoiceChip(),
  );
}

class Example3dChoiceChip extends StatefulWidget {
  @override
  State<Example3dChoiceChip> createState() => _Example3dChoiceChipState();
}

class _Example3dChoiceChipState extends State<Example3dChoiceChip> {
  int choiceIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Align(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChoiceChip3D(
            style: ChoiceChip3DStyle.blue,
            onSelected: () => setState(() => choiceIndex = 0),
            onUnSelected: () => null,
            selected: choiceIndex == 0,
            child: Text("Choice One"),
          ),
          ChoiceChip3D(
            style: ChoiceChip3DStyle.blue,
            onSelected: () => setState(() => choiceIndex = 1),
            onUnSelected: () => null,
            selected: choiceIndex == 1,
            child: Text("Choice Two"),
          )
        ],
      ),
    )));
  }
}
