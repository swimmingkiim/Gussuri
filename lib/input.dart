import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gussuri/component/TimePicker.dart';
import 'package:gussuri/component/gradient_box.dart';
import 'package:gussuri/component/input_card.dart';
import 'package:gussuri/component/slide_button.dart';
import 'package:gussuri/component/title_box.dart';
import 'package:intl/intl.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String formattedDate = DateFormat('yyyy年M月d日').format(DateTime.now());
  final Map<String, dynamic> _sleepyData = {
    "bed_time": "",
    "comments": "",
    "TASAFA": "",
    "get_up_time": "",
    "dysfunction": null,
    "WASO": null,
    "SOL": "",
    "NOA": null
  };

  @override
  Widget build(BuildContext context) {
    const timePickerKey =
    GlobalObjectKey<TimePickerState>('__TIME_PICKER_KEY__');
    const timePickerKeySecond =
    GlobalObjectKey<TimePickerState>('__TIME_PICKER_KEY2__');
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: GradientBox(
                child: Column(
          children: [
            TitleBox(text: formattedDate),
            SlideButton(
              onChanged: (value) {
                setState(() {
                  _sleepyData['dysfunction'] = value;
                });
              },
            ),
            InputCard(
              title: '布団を出た時間',
              form: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: TimePickerWidget(
                      key: timePickerKey,
                      value: DateTime.now(),
                      onChanged: (value) => {
                        setState(() {
                          _sleepyData["get_up_time"] = value;
                        })
                      }))
            ),
            InputCard(
              title: '布団に入った時間',
              form: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: TimePickerWidget(
                      key: timePickerKeySecond,
                      value: DateTime.now(),
                      onChanged: (value) => {
                        setState(() {
                          _sleepyData["bed_time"] = value;
                        })
                      }))
            ),
            Column(children: [
              Container(
                  padding: EdgeInsets.all(30.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(50, (ind) {
                      return ListTile(
                        title: Text('$ind'),
                      );
                    }).toList(),
                  )),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left:20.w),
                child: Image.asset('images/baku-kun-2.png'),
              )
            ]),
          ],
        ))));
  }
}
