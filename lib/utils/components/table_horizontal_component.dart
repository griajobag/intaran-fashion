import 'package:flutter/material.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';

class TableHorizontalComponent extends StatefulWidget {
  final double? indexNolTablet;
  final double? indexNolPhone;
  final double? indexSatuTablet;
  final double? indexSatuPhone;
  final double? indexDuaTablet;
  final double? indexDuaPhone;
  final List<TableRow>? listTableRow;
  final double? padding;

  TableHorizontalComponent(
      {this.indexNolTablet = 2,
      this.indexNolPhone = 6,
      this.indexSatuTablet = 1,
      this.indexSatuPhone = 1,
      this.indexDuaTablet = 12,
      this.indexDuaPhone = 14,
      this.padding = 10,
      @required this.listTableRow});

  @override
  _TableHorizontalComponentState createState() =>
      _TableHorizontalComponentState();
}

class _TableHorizontalComponentState extends State<TableHorizontalComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.padding!),
      child: Table(
        columnWidths: {
          0: (GlobalFunction.isTablet(context))
              ? FlexColumnWidth(widget.indexNolTablet!)
              : FlexColumnWidth(widget.indexNolPhone!),
          1: (GlobalFunction.isTablet(context))
              ? FlexColumnWidth(widget.indexSatuTablet!)
              : FlexColumnWidth(widget.indexSatuPhone!),
          2: (GlobalFunction.isTablet(context))
              ? FlexColumnWidth(widget.indexDuaTablet!)
              : FlexColumnWidth(widget.indexDuaPhone!),
        },
        children: widget.listTableRow!,
      ),
    );
  }
}
