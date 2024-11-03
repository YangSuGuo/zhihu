import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zhihu/pages/daily_report/daily_report.dart';
import 'package:zhihu/pages/main.dart';
import 'package:zhihu/widget/show_modal_bottom_detail.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Main(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leadingWidth: 60,
        title: const Text('知乎日报',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  showModalBottomDetail(
                    height: 400,
                    context: context,
                    child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        padding: EdgeInsets.only(
                            bottom: 28.h, left: 24.w, right: 24.w),
                          children: const [
                            SizedBox(
                              width: 1,
                              child: Text("data"),
                            )
                          ]));
                },
                icon: const Icon(Icons.settings, size: 26),
                tooltip: '设置',
              ))
        ],
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        leading: leadingTime(colorScheme),
      ),
      body: const DailyReport(),
    );
  }

  /// 日期显示
  Widget leadingTime(ColorScheme colorScheme) {
    DateTime dateTime = DateTime.now();
    return Row(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  DateFormat('dd').format(dateTime),
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(DateFormat('MM月').format(dateTime),
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.bold)),
              ])),
      const SizedBox(
          width: 1,
          height: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey),
          ))
    ]);
  }
}
