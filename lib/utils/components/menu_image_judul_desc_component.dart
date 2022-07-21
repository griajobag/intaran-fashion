import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';

class MenuImageJudulDescComponent extends StatefulWidget {
  final String? assetImage;
  final String? menuTitle;
  final String? menuDesc;
  final Function()? functionOnTap;
  MenuImageJudulDescComponent(
      {Key? key,
      required this.assetImage,
      required this.menuTitle,
      required this.menuDesc,
      required this.functionOnTap})
      : super(key: key);

  @override
  State<MenuImageJudulDescComponent> createState() =>
      _MenuImageJudulDescComponentState();
}

class _MenuImageJudulDescComponentState
    extends State<MenuImageJudulDescComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.functionOnTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(widget.assetImage!),
                width: 50,
                height: 50,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent(
                      text: widget.menuTitle!,
                      fontWeight: FontWeight.bold,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    TextComponent(
                      text: widget.menuDesc!,
                      textSize: MyTextSize.small,
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
