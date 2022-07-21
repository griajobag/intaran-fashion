import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';

// enum InputTextType { text, email, password, number, paragraf }

class TextFormFieldController extends ChangeNotifier {
  bool required = false;
  InputTypeField type = InputTypeField.text;
  bool showPassword = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController con = TextEditingController();
  String? value;
  Function(VoidCallback fn)? setState;
  VoidCallback? onEditingComplete;
  ValueChanged<String>? onChanged;
  GestureTapCallback? onTap;
  ValueChanged<String>? onFieldSubmitted;
  FormFieldSetter<String>? onSaved;
  bool? visibility;

  TextFormFieldController({
    this.required = false,
  });

  String? validator(String? v, {FormFieldValidator<String>? otherValidator}) {
    if (required && (v?.isEmpty ?? false)) {
      return 'The field is required';
    }
    if (type == InputTypeField.email) {
      String pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      final regex = RegExp(pattern);
      if ((v?.isEmpty ?? false) || !regex.hasMatch(v!)) {
        return 'Enter a valid email address';
      } else {
        return null;
      }
    }
    if (otherValidator != null) {
      return otherValidator(v);
    }
    return null;
  }

  bool isValid() {
    bool? valid = key.currentState?.validate();
    if (valid == null) {
      return true;
    }
    return valid;
  }

  void setVisible(bool value) {
    setState!(() {
      visibility = value;
    });
  }

  bool getVisible() {
    return visibility == null ? false : visibility!;
  }

  void init(Function(VoidCallback fn)? setStateX) {
    setState = setStateX;
  }

  @override
  void dispose() {
    con.dispose();
    super.dispose();
  }
}

enum InputTypeField { date, time, text, paragraf, number, phone, email }

class TextFormFieldComponent extends StatefulWidget {
  final TextFormFieldController controller;
  final String? hintText;
  final dynamic functionsValidator;
  final Function()? functionOnTap;
  final dynamic functionOnChange;
  final dynamic onSubmit;
  final bool? readOnly;
  final int? maxLines;
  final int? maxLength;
  final Color? textColor;
  final Color? labelColor;
  final double? textSize;
  final IconData? iconPrefix;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? listFormatter;
  final InputTypeField? textInputType;
  final Color? underLineFocusColor;
  final String? labelText;
  final bool? isFilled;
  final Color? fillColor;
  final double? radiusBorderSize;
  final double? iconSize;
  final bool? isCustomDerationEnable;
  final FocusNode? focusNode;
  bool? isPasswordVisible;
  final bool? isRequired;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;

  TextFormFieldComponent(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.functionsValidator,
      this.functionOnTap,
      this.functionOnChange,
      this.readOnly = false,
      this.maxLines = 1,
      this.maxLength,
      this.listFormatter,
      this.isPasswordVisible = false,
      this.focusNode,
      this.isCustomDerationEnable = true,
      this.onSubmit,
      this.textColor = GlobalColor.colorBlack,
      this.labelColor = GlobalColor.colorBlack,
      this.textSize = MyTextSize.normal,
      this.iconSize = MyIconSize.medium,
      this.iconPrefix,
      this.labelText,
      this.textInputAction,
      this.underLineFocusColor = GlobalColor.colorBlack,
      this.textInputType = InputTypeField.text,
      this.isFilled = false,
      this.fillColor = GlobalColor.colorBlack,
      this.radiusBorderSize = 0,
      this.isRequired = false,
      this.marginTop = 10,
      this.marginBottom = 10,
      this.marginLeft = 10,
      this.marginRight = 10});

  @override
  _TextFormFieldComponentState createState() => _TextFormFieldComponentState();
}

class _TextFormFieldComponentState extends State<TextFormFieldComponent> {
  @override
  void initState() {
    widget.controller.init(setState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.required = widget.isRequired!;
    widget.controller.visibility = widget.isPasswordVisible;
    widget.controller.type = widget.textInputType!;
    final _decoration = InputDecoration(
        filled: true,
        fillColor: GlobalColor.colorBlack.withOpacity(.05),
        // hintText: widget.hintText,
        label: Text(widget.hintText!),
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
        labelText: widget.labelText,
        hintStyle: TextStyle(color: widget.textColor!.withOpacity(.5)),
        prefixIcon: (widget.iconPrefix == null)
            ? null
            : Icon(
                widget.iconPrefix,
                size: widget.iconSize,
              ),
        suffixIcon: (widget.hintText!.toLowerCase() != "Password".toLowerCase())
            ? null
            : IconButton(
                iconSize: 15,
                icon: Icon(
                  widget.isPasswordVisible!
                      ? Icons.visibility_off
                      : Icons.visibility, //change icon based on boolean value
                  color: GlobalColor.primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    widget.isPasswordVisible =
                        !widget.isPasswordVisible!; //change boolean value
                  });
                }),
        labelStyle:
            TextStyle(fontSize: widget.textSize, color: widget.labelColor!));
    return Container(
      margin: EdgeInsets.only(
          top: widget.marginTop,
          bottom: widget.marginBottom,
          left: widget.marginLeft,
          right: widget.marginRight),
      child: Form(
          key: widget.controller.key,
          child: TextFormField(
            focusNode: widget.focusNode,
            onTap: widget.functionOnTap,
            readOnly: (widget.textInputType == InputTypeField.date ||
                    widget.textInputType == InputTypeField.time)
                ? true
                : widget.readOnly!,
            controller: widget.controller.con,
            maxLines: widget.maxLines,
            textInputAction: (widget.textInputAction == null)
                ? (kIsWeb)
                    ? widget.textInputAction
                    : (Platform.isIOS)
                        ? null
                        : widget.textInputAction
                : (widget.textInputAction == TextInputAction.none)
                    ? (Platform.isIOS)
                        ? null
                        : widget.textInputAction
                    : widget.textInputAction,
            onFieldSubmitted: widget.onSubmit,
            onChanged: widget.functionOnChange,
            maxLength: (widget.maxLength == null) ? null : widget.maxLength,
            // keyboardType: widget.textInputType,
            inputFormatters: widget.listFormatter,
            style: TextStyle(
                fontSize: widget.textSize,
                color: widget.textColor!.withOpacity(.5)),
            validator: widget.functionsValidator,
            obscureText:
                (widget.hintText!.toLowerCase() == "Password".toLowerCase())
                    ? widget.isPasswordVisible!
                    : false,
            decoration: widget.isCustomDerationEnable!
                ? _decoration
                : InputDecoration(
                    filled: widget.isFilled,
                    fillColor: widget.fillColor!.withOpacity(.5),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.radiusBorderSize!),
                      borderSide:
                          BorderSide(color: widget.underLineFocusColor!),
                    ),
                    border: UnderlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(widget.radiusBorderSize!),
                      borderSide:
                          BorderSide(color: widget.underLineFocusColor!),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.radiusBorderSize!),
                        borderSide:
                            BorderSide(color: widget.underLineFocusColor!)),
                    errorBorder: UnderlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.radiusBorderSize!),
                        borderSide:
                            BorderSide(color: widget.underLineFocusColor!)),
                    labelText: widget.labelText,
                    hintText: widget.hintText,
                    hintStyle:
                        TextStyle(color: widget.textColor!.withOpacity(.5)),
                    prefixIcon: (widget.iconPrefix == null)
                        ? null
                        : Icon(
                            widget.iconPrefix,
                            size: widget.iconSize,
                          ),
                    labelStyle: TextStyle(
                        fontSize: widget.textSize, color: widget.labelColor!)),
          )),
    );
  }
}
