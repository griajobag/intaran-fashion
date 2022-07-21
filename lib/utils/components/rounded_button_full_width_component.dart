import 'package:flutter/material.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';

class RoundedButtonFullWidthComponent extends StatefulWidget {
  final Color? color;
  final String? text;
  final Color? textColor;
  final double? sizeRounded;
  final double? textSize;
  final String? imageUrl;
  final Function()? functionClick;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;

  RoundedButtonFullWidthComponent(
      {this.color = GlobalColor.primaryColorButton,
      required this.text,
      this.textColor = GlobalColor.colorWhite,
      this.sizeRounded = 10,
      this.textSize = MyTextSize.normal,
      this.imageUrl = "",
      required this.functionClick,
      this.marginTop = 10,
      this.marginBottom = 10,
      this.marginLeft = 10,
      this.marginRight = 10});

  @override
  _RoundedButtonFullWidthComponentState createState() =>
      _RoundedButtonFullWidthComponentState();
}

class _RoundedButtonFullWidthComponentState
    extends State<RoundedButtonFullWidthComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: widget.marginTop,
          bottom: widget.marginBottom,
          left: widget.marginLeft,
          right: widget.marginRight),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.sizeRounded!),
          color: widget.color!),
      child: Material(
        borderRadius: BorderRadius.circular(widget.sizeRounded!),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(widget.sizeRounded!),
          onTap: widget.functionClick,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: (widget.imageUrl == "") ? false : true,
                    child: Container(
                      margin: const EdgeInsets.only(right: 6),
                      child: Image(
                        image: AssetImage(widget.imageUrl!),
                        width: 15,
                      ),
                    )),
                TextComponent(
                    text: widget.text!,
                    textColor: widget.textColor!,
                    textSize: widget.textSize!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
