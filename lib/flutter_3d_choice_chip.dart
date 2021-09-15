library flutter_3d_choice_chip;

import 'package:flutter/material.dart';

typedef Bool2VoidFunc = void Function(bool);

class ChoiceChip3DStyle {
  final Color topColor;
  final Color backColor;
  final BorderRadius borderRadius;
  final double z;
  final double selectedZ;
  const ChoiceChip3DStyle(
      {this.topColor = const Color(0xFF45484c),
      this.backColor = const Color(0xFF191a1c),
      this.borderRadius = const BorderRadius.all(Radius.circular(7.0)),
      this.z = 8.0,
      this.selectedZ = 3.0});

  static const red = ChoiceChip3DStyle(
      topColor: Color(0xFFc62f2f), backColor: Color(0xFF922525));
  static const blue = ChoiceChip3DStyle(
      topColor: Color(0xFF25a09c), backColor: Color(0xFF197572));
  static const white = ChoiceChip3DStyle(
      topColor: Color(0xFFffffff), backColor: Color(0xFFCFD8DC));
}

class ChoiceChip3D extends StatelessWidget {
  final Bool2VoidFunc onSelected;
  final Widget child;
  final ChoiceChip3DStyle style;
  final double width;
  final double height;
  final bool selected;

  const ChoiceChip3D(
      {required this.onSelected,
      required this.child,
      this.style = ChoiceChip3DStyle.white,
      this.width = 100.0,
      this.height = 90.0,
      this.selected = false,
      Key? key})
      : super(key: key);

  Widget _buildBackLayout() {
    return Padding(
      padding: EdgeInsets.only(top: style.z),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            borderRadius: style.borderRadius,
            boxShadow: [BoxShadow(color: style.backColor)]),
        child: ConstrainedBox(
          constraints:
              BoxConstraints.expand(width: width, height: height - style.z),
        ),
      ),
    );
  }

  Widget _buildTopLayout() {
    return Padding(
      padding: EdgeInsets.only(top: selected ? style.z - style.selectedZ : 0.0),
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
            borderRadius: style.borderRadius,
            boxShadow: [BoxShadow(color: style.topColor)]),
        child: ConstrainedBox(
          constraints:
              BoxConstraints.expand(width: width, height: height - style.z),
          child: Container(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[_buildBackLayout(), _buildTopLayout()],
      ),
      onTap: () {
        onSelected(true);
      },
    );
  }
}
