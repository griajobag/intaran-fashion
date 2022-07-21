import 'package:flutter/material.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';

class TextInkwellComponent extends StatefulWidget {
  final double? fontsize;
  final String? text;
  final Color? color;
  final TextAlign? textAlign;
  final bool isFullWidth;
  final AlignmentGeometry alignmentGeometry;
  final Function()? functionOnTap;
  final Function()? onLongTap;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;

  TextInkwellComponent(
      {this.fontsize = MyTextSize.normal,
      required this.text,
      required this.color,
      this.isFullWidth = false,
      this.alignmentGeometry = Alignment.centerRight,
      this.textAlign = TextAlign.left,
      this.onLongTap,
      required this.functionOnTap,
      this.marginTop = 10,
      this.marginBottom = 10,
      this.marginLeft = 10,
      this.marginRight = 10})
      : super(key: null);

  @override
  _TextInkwellComponentState createState() => _TextInkwellComponentState();
}

class _TextInkwellComponentState extends State<TextInkwellComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: widget.marginTop,
          bottom: widget.marginBottom,
          left: widget.marginLeft,
          right: widget.marginRight),
      child: InkWell(
        onTap: widget.functionOnTap,
        onLongPress: widget.onLongTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          alignment: widget.alignmentGeometry,
          width: widget.isFullWidth ? MediaQuery.of(context).size.width : null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextComponent(
                text: widget.text!,
                textAlign: widget.textAlign!,
                textSize: widget.fontsize!,
                textColor: widget.color!),
          ),
        ),
      ),
    );
  }
}
