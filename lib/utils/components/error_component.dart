import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/components/text_inkwell_component.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';

class ErrorComponent extends StatefulWidget {
  final String? errorMessage;
  final Function()? functionOnTap;
  ErrorComponent({required this.errorMessage, required this.functionOnTap});

  @override
  _ErrorComponentState createState() => _ErrorComponentState();
}

class _ErrorComponentState extends State<ErrorComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[300],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextComponent(
            text: widget.errorMessage!,
            textAlign: TextAlign.center,
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: InkWell(
                  onTap: widget.functionOnTap,
                  child: const Icon(
                    Icons.refresh,
                    size: 40,
                  ))),
          Divider(
            color: GlobalColor.primaryGrey.withOpacity(0.5),
            height: 1,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextComponent(text: "Atau"),
          ),

          TextInkwellComponent(
              alignmentGeometry: Alignment.center,
              text: "Laporkan Masalah",
              color: GlobalColor.colorBlue,
              functionOnTap: () {}),

          Visibility(
            visible: kDebugMode,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: TextComponent(
                  text:
                      "Debug Only!\nAnda bisa melihat detail errornya di Firebase. Terimakasih."),
            ),
          )

          // Container(
          //   margin: EdgeInsets.only(top: 10),
          //   child: Text(Languages.of(context).atauLaporkanMasalah),
          // ),
          // Container(
          //   margin: EdgeInsets.only(top: 5),
          //   child: Text(Languages.of(context).laporanMenu),
          // ),
        ],
      ),
    );
  }
}
