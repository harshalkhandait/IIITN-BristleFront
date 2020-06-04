import 'package:alphatesting/Components/ColorPickerButton.dart';
import 'package:flutter/material.dart';
import 'package:painter2/painter2.dart';
class DrawBar extends StatelessWidget {
  final PainterController _controller;

  DrawBar(this._controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
              child: Slider(
            value: _controller.thickness,
            onChanged: (value) => setState(() {
                  _controller.thickness = value;
                }),
            min: 1.0,
            max: 20.0,
            activeColor: Colors.greenAccent,
          ));
        })),
        ColorPickerButton(_controller, false),
        ColorPickerButton(_controller, true),
      ],
    );
  }
}