import 'package:flutter/material.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_inkwell_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';

class DropDownComponent<T> extends StatefulWidget {
  final String? labelText;
  final T? objectSelected;
  final List<T>? listObject;
  final dynamic onChangeValue;
  final String Function(T)? valueObjectAsLabel;
  final IconData? iconDataPrefix;
  final Color iconColor;
  final double? radiusBorderSize;
  final String? hintText;
  final double? textSize;
  final double? hintSize;
  final bool enableCustomDecoration;
  final bool showMenuTambah;
  final String textMenuTambah;
  final Function()? functionMenuTambah;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;

  DropDownComponent(
      {required this.labelText,
      required this.objectSelected,
      required this.listObject,
      required this.valueObjectAsLabel,
      this.iconDataPrefix,
      this.textSize = MyTextSize.normal,
      this.hintText = "Pilih Salah Satu",
      required this.onChangeValue,
      this.radiusBorderSize = 0,
      this.enableCustomDecoration = true,
      this.showMenuTambah = false,
      this.iconColor = GlobalColor.primaryColor,
      this.textMenuTambah = "",
      this.functionMenuTambah,
      this.hintSize = MyTextSize.normal,
      this.marginTop = 10,
      this.marginBottom = 10,
      this.marginLeft = 10,
      this.marginRight = 10})
      : super(key: null);

  @override
  _DropDownComponentState<T> createState() => _DropDownComponentState<T>();
}

class _DropDownComponentState<T> extends State<DropDownComponent<T>> {
  @override
  Widget build(BuildContext context) {
    final _decoration = InputDecoration(
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        fillColor: GlobalColor.colorBlack.withOpacity(.05),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: GlobalColor.colorBlack.withOpacity(.05)),
          borderRadius:
              BorderRadius.all(Radius.circular(widget.radiusBorderSize!)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: GlobalColor.colorBlack.withOpacity(.05)),
          borderRadius:
              BorderRadius.all(Radius.circular(widget.radiusBorderSize!)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: GlobalColor.colorBlack.withOpacity(.05)),
          borderRadius:
              BorderRadius.all(Radius.circular(widget.radiusBorderSize!)),
        ),
        prefixIcon: (widget.iconDataPrefix == null)
            ? null
            : Icon(
                widget.iconDataPrefix,
                size: MyIconSize.medium,
                color: widget.iconColor.withOpacity(.5),
              ),
        hintStyle: TextStyle(fontSize: widget.hintSize),
        labelStyle: TextStyle(
          fontSize: widget.textSize,
        ));
    return Container(
      margin: EdgeInsets.only(
          top: widget.marginTop,
          bottom: widget.marginBottom,
          left: widget.marginLeft,
          right: widget.marginRight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<T>(
              decoration: widget.enableCustomDecoration
                  ? _decoration
                  : InputDecoration(
                      // filled: true,
                      // enabledBorder: InputBorder.none,
                      // focusedBorder: InputBorder.none,
                      prefixIcon: (widget.iconDataPrefix == null)
                          ? null
                          : Icon(
                              widget.iconDataPrefix,
                              size: MyIconSize.medium,
                              color: widget.iconColor,
                            ),
                      fillColor: GlobalColor.colorWhite,
                      labelText: widget.labelText,
                      labelStyle: const TextStyle(fontSize: MyTextSize.normal)),
              value: widget.objectSelected,
              items: widget.listObject!
                  .map<DropdownMenuItem<T>>((e) => DropdownMenuItem<T>(
                      value: e,
                      child: Container(
                          child: TextComponent(
                        text: widget.valueObjectAsLabel!(e),
                      ))))
                  .toList(),
              onChanged: widget.onChangeValue),
          Padding(padding: EdgeInsets.only(top: 10)),
          Visibility(
            visible: widget.showMenuTambah,
            child: TextInkwellComponent(
                text: widget.textMenuTambah,
                alignmentGeometry: Alignment.centerRight,
                isFullWidth: false,
                textAlign: TextAlign.center,
                color: GlobalColor.primaryColor,
                functionOnTap: widget.functionMenuTambah),
          )
        ],
      ),
    );
  }
}
