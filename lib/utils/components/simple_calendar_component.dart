import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intaranfashion_mobile/utils/components/text_component.dart';
import 'package:intaranfashion_mobile/utils/globals/constants.dart';
import 'package:intaranfashion_mobile/utils/globals/global_color.dart';
import 'package:intaranfashion_mobile/utils/globals/global_function.dart';
import 'package:intl/intl.dart';

class SimpleCalendarComponent<T> extends StatefulWidget {
  final List<T>? listJadwalPerbulan;
  final List<DateTime>? listDate;
  final Map<DateTime, List<T>>? mapEvent;

  final bool? isLoadingData;
  final Function()? functionClickPrevMonth;
  final Function()? functionClickNextMonth;
  final Function(DateTime jadwalPraktekModel)? functionOnClickItem;
  final DateTime? firstDayCurrentMonth;
  final DateTime? lastDayCurrentMonth;
  final int? incrementMonth;

  Color bgTanggalHariIni = Colors.green;
  Color colorTextHariIni = Colors.white;
  Color colorTextAdaEvent = Colors.white;
  Color bgAdaEvent = Colors.orange;
  Color bgColorSelected = Colors.blue;

  SimpleCalendarComponent(
      {@required this.listJadwalPerbulan,
      @required this.listDate,
      @required this.mapEvent,
      this.isLoadingData = true,
      @required this.functionClickPrevMonth,
      @required this.functionClickNextMonth,
      @required this.firstDayCurrentMonth,
      @required this.lastDayCurrentMonth,
      @required this.functionOnClickItem,
      @required this.incrementMonth,
      this.bgTanggalHariIni = Colors.green,
      this.colorTextHariIni = Colors.white,
      this.colorTextAdaEvent = Colors.white,
      this.bgAdaEvent = Colors.orange,
      this.bgColorSelected = Colors.blue});

  @override
  _SimpleCalendarComponentState<T> createState() =>
      _SimpleCalendarComponentState<T>();
}

class _SimpleCalendarComponentState<T>
    extends State<SimpleCalendarComponent<T>> {
  DateFormat dateFormat = DateFormat("MMM yyyy");

  //get date
  bool isDateSelected = false;
  DateTime dateSelected = DateTime.now();
  List<HariModel> listHari = [];

  //color tanggal

  @override
  void initState() {
    if (widget.listDate![0].month != DateTime.now().month) {
      dateSelected = widget.listDate![0];
    }
    super.initState();
  }

  void initHari(BuildContext context) {
    listHari = [
      HariModel(index: 0, days: "MIN"),
      HariModel(index: 0, days: "SEN"),
      HariModel(index: 0, days: "SEL"),
      HariModel(index: 0, days: "RAB"),
      HariModel(index: 0, days: "KAM"),
      HariModel(index: 0, days: "JUM"),
      HariModel(index: 0, days: "SAB"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initHari(context);
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextComponent(
                    text: DateFormat('MMM yyyy')
                        .format(widget.listDate![0])
                        .toUpperCase(),
                    fontWeight: FontWeight.bold,
                    textColor: GlobalColor.colorHijauLumut,
                  ),
                ),
                Visibility(
                  visible: (DateFormat("MM/yyyy").format(DateTime.now()) ==
                          DateFormat("MM/yyyy")
                              .format(widget.lastDayCurrentMonth!))
                      ? false
                      : true,
                  child: InkWell(
                    onTap: widget.functionClickPrevMonth,
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.all(10),
                      child: TextComponent(text: "Prev"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: widget.functionClickNextMonth,
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.all(10),
                    child: TextComponent(text: "Next"),
                  ),
                )
              ],
            ),
          ),
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: listHari
                .map((e) => Container(
                      alignment: Alignment.center,
                      child: TextComponent(
                        text: e.days!,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                .toList(),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Visibility(
                  visible: widget.isLoadingData!,
                  child: GlobalFunction.showLoading()),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                childAspectRatio:
                    (defaultTargetPlatform == TargetPlatform.macOS ||
                            defaultTargetPlatform == TargetPlatform.windows ||
                            defaultTargetPlatform == TargetPlatform.linux)
                        ? 2
                        : (GlobalFunction.isTablet(context))
                            ? 1.3
                            : GlobalFunction.childAspekRasioKalender(context),
                crossAxisCount: 7,
                children: widget.mapEvent!.entries
                    .map((e) => (e.key == DateTime(0, 0, 0, 0))
                        ? Container()
                        : (e.key == DateTime(1, 1, 1, 1))
                            ? Container()
                            : (e.key == DateTime(2, 2, 2, 2))
                                ? Container()
                                : (e.key == DateTime(3, 3, 3, 3))
                                    ? Container()
                                    : (e.key == DateTime(4, 4, 4, 4))
                                        ? Container()
                                        : (e.key == DateTime(5, 5, 5, 5))
                                            ? Container()
                                            : (e.key == DateTime(6, 6, 6, 6))
                                                ? Container()
                                                : InkWell(
                                                    onTap: () {
                                                      widget.functionOnClickItem!(
                                                          e.key);
                                                      setState(() {
                                                        dateSelected = e.key;
                                                      });
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              1),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors
                                                                .blueAccent),
                                                        color: (DateFormat(
                                                                        'dd MMM yyyy')
                                                                    .format(
                                                                        dateSelected) ==
                                                                DateFormat(
                                                                        'dd MMM yyyy')
                                                                    .format(
                                                                        e.key))
                                                            ? widget
                                                                .bgColorSelected
                                                            : (DateFormat('dd MMM yyyy')
                                                                        .format(e
                                                                            .key) ==
                                                                    DateFormat(
                                                                            'dd MMM yyyy')
                                                                        .format(DateTime
                                                                            .now()))
                                                                ? widget
                                                                    .bgTanggalHariIni
                                                                : (e.value
                                                                        .isNotEmpty)
                                                                    ? widget
                                                                        .bgAdaEvent
                                                                    : Colors
                                                                        .white,
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          TextComponent(
                                                            text: DateFormat(
                                                                    'dd')
                                                                .format(e.key),
                                                            textColor: (DateFormat(
                                                                            'dd MMM yyyy')
                                                                        .format(e
                                                                            .key) ==
                                                                    DateFormat(
                                                                            'dd MMM yyyy')
                                                                        .format(
                                                                            DateTime
                                                                                .now())
                                                                ? widget
                                                                    .colorTextHariIni
                                                                : (e.value
                                                                        .isNotEmpty)
                                                                    ? widget
                                                                        .colorTextAdaEvent
                                                                    : Colors
                                                                        .black),
                                                          ),
                                                          Visibility(
                                                            visible: e.value
                                                                .isNotEmpty,
                                                            child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            10),
                                                                child:
                                                                    TextComponent(
                                                                  text: e.value
                                                                      .length
                                                                      .toString(),
                                                                  textColor: (DateFormat('dd MMM yyyy').format(e
                                                                              .key) ==
                                                                          DateFormat('dd MMM yyyy').format(DateTime
                                                                              .now())
                                                                      ? widget
                                                                          .colorTextHariIni
                                                                      : (e.value
                                                                              .isNotEmpty)
                                                                          ? widget
                                                                              .colorTextAdaEvent
                                                                          : Colors
                                                                              .black),
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ))
                    .toList(),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(width: 10, height: 10, color: Colors.orange),
                Container(
                  margin: EdgeInsets.only(left: 3),
                  child: TextComponent(
                    text: "Terdapat transaksi",
                    textSize: MyTextSize.small,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 10,
                    height: 10,
                    color: Colors.blue),
                Container(
                  margin: EdgeInsets.only(left: 3),
                  child: TextComponent(
                    text: "Tanggal dipilih",
                    textSize: MyTextSize.small,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 10,
                    height: 10,
                    color: Colors.green),
                Container(
                  margin: EdgeInsets.only(left: 3),
                  child: TextComponent(
                    text: "Tanggal hari ini",
                    textSize: MyTextSize.small,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HariModel {
  int? index;
  String? days;
  HariModel({@required this.index, @required this.days});
}
