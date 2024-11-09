import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
        title: const Text('知乎日报', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
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
                          padding: EdgeInsets.only(bottom: 28.h, left: 24.w, right: 24.w),
                          children: [
                            Container(
                              height: 225,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(35)),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context).size.width - 50,
                                          height: 140,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(35),
                                            child: AspectRatio(
                                              aspectRatio: 1.5,
                                              child: Image.asset(
                                                "assets/images/png/macos_3840x2160.jpg",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )),
                                      Gap(5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.ice_skating),
                                                color: Theme.of(context).colorScheme.primary,
                                                style: IconButton.styleFrom(
                                                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    "我的订阅",
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: Theme.of(context).colorScheme.onPrimary,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                  AutoSizeText(
                                                    "我的订阅我的订",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Theme.of(context).colorScheme.onPrimary.withAlpha(210),
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                              // width: 20,
                                              // height: 20,
                                              child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.favorite_border),
                                            color: Theme.of(context).colorScheme.primary,
                                            style: IconButton.styleFrom(
                                              // fixedSize: Size(30, 30),
                                              backgroundColor: Theme.of(context).colorScheme.onPrimary,
                                            ),
                                          ))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
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
                  style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(DateFormat('MM月').format(dateTime),
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
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
