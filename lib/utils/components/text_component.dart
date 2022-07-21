import 'package:flutter/material.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';

class TextComponent extends StatefulWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow textOverflow;
  final double opacity;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;

  const TextComponent(
      {Key? key,
      required this.text,
      this.textSize = MyTextSize.normal,
      this.textColor = GlobalColor.colorBlack,
      this.fontWeight = FontWeight.normal,
      this.maxLines,
      this.opacity = .7,
      this.textAlign = TextAlign.left,
      this.textOverflow = TextOverflow.visible,
      this.marginBottom = 0,
      this.marginLeft = 0,
      this.marginRight = 0,
      this.marginTop = 0})
      : super(key: key);

  @override
  _TextComponentState createState() => _TextComponentState();
}

class _TextComponentState extends State<TextComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: widget.marginLeft,
          right: widget.marginRight,
          top: widget.marginTop,
          bottom: widget.marginBottom),
      child: Text(
        widget.text,
        maxLines: widget.maxLines,
        overflow: widget.textOverflow,
        style: TextStyle(
            fontWeight: widget.fontWeight,
            color: (widget.textColor == GlobalColor.colorWhite)
                ? widget.textColor
                : widget.textColor.withOpacity(widget.opacity),
            fontSize: widget.textSize),
        textAlign: widget.textAlign,
      ),
    );
  }
}
