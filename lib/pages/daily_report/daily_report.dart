import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zhihu/model/stories_model.dart';
import 'package:zhihu/widget/list.dart';

class DailyReport extends ConsumerStatefulWidget {
  const DailyReport({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DailyReportState();
}

class _DailyReportState extends ConsumerState<DailyReport> {
  DateTime dateTime = DateTime.now(); // 时间
  List<StoriesData> items = []; // 知乎日报

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }

  // bodyList
  Widget _buildList() {
    return EasyRefresh(
        header: const ClassicHeader(
          hapticFeedback: true,
          hitOver: true,
          safeArea: false,
          processedDuration: Duration.zero,
          showMessage: false,
          showText: false,
        ),
        footer: const ClassicFooter(
          hapticFeedback: true,
          processedDuration: Duration.zero,
          showMessage: false,
          showText: false,
        ),
        onRefresh: () async {
          // 下拉刷新
        },
        onLoad: () async {
          // 上拉加载
        },
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {},
                  child: Item(item: items[index]),
                ));
          },
        ));
  }
}
