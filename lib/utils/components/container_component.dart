import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';

class ContainerComponent extends StatefulWidget {
  final Widget? child;
  final Color? color;
  final double radiusTopLeft;
  final double radiusTopRight;
  final double radiusBottomLeft;
  final double radiusBottomRight;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  final double padding;
  const ContainerComponent(
      {Key? key,
      required this.child,
      this.color = GlobalColor.colorWhite,
      this.radiusBottomLeft = 0,
      this.radiusBottomRight = 0,
      this.radiusTopLeft = 0,
      this.radiusTopRight = 0,
      this.marginBottom = 0,
      this.marginLeft = 0,
      this.marginRight = 0,
      this.marginTop = 0,
      this.padding = 0})
      : super(key: key);

  @override
  State<ContainerComponent> createState() => _ContainerComponentState();
}

class _ContainerComponentState extends State<ContainerComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: widget.marginLeft,
          right: widget.marginRight,
          bottom: widget.marginBottom,
          top: widget.marginTop),
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(widget.radiusBottomLeft),
              bottomRight: Radius.circular(widget.radiusBottomRight),
              topLeft: Radius.circular(widget.radiusTopLeft),
              topRight: Radius.circular(widget.radiusTopRight))),
      child: widget.child,
    );
  }
}
