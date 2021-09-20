library flutter_3d_choice_chip;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Custom style object
class ChoiceChip3DStyle {
  ///the color used for the top part of the chip
  final Color topColor;

  ///the color used for the shadowed part of the chip
  final Color backColor;

  ///the chip border radius
  final BorderRadius borderRadius;

  ///the amount of default elevation
  final double z;

  ///the amount of elevation when selected
  final double selectedZ;

  ///default constructor
  const ChoiceChip3DStyle(
      {this.topColor = const Color(0xFF45484c),
      this.backColor = const Color(0xFF191a1c),
      this.borderRadius = const BorderRadius.all(Radius.circular(7.0)),
      this.z = 8.0,
      this.selectedZ = 3.0});

  ///preconfigured red style
  static const red = ChoiceChip3DStyle(
      topColor: Color(0xFFc62f2f), backColor: Color(0xFF922525));

  ///preconfigured blue style
  static const blue = ChoiceChip3DStyle(
      topColor: Color(0xFF25a09c), backColor: Color(0xFF197572));

  ///preconfigured white style
  static const white = ChoiceChip3DStyle(
      topColor: Color(0xFFffffff), backColor: Color(0xFFCFD8DC));
}

///Stateless Widget Object
///Use [onSelected] to provide a callback method when the chip is selected
class ChoiceChip3D extends StatelessWidget {
  ///void callback when chip's state changes to selected
  final VoidCallback onSelected;

  ///void callback when chip's state changes to unselected
  final VoidCallback onUnSelected;

  ///a child widget for the chip, such as a Text or Icon
  final Widget child;

  ///custom or preconfigured [ChoiceChip3DStyle] object
  final ChoiceChip3DStyle style;

  ///width of chip
  final double width;

  ///height of chip
  final double height;

  ///when this chip is selected or not
  final bool selected;

  ///border
  final BoxBorder? border;

  ///default ChoiceChip3D constructor
  const ChoiceChip3D(
      {required this.onSelected,
      required this.onUnSelected,
      required this.child,
      this.style = ChoiceChip3DStyle.white,
      this.width = 100.0,
      this.height = 90.0,
      this.selected = false,
      this.border,
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
            border: border,
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
      onTap: () => selected ? onUnSelected() : onSelected(),
    );
  }
}
