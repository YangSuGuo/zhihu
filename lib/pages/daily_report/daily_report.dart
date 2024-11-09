import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zhihu/db/database/dao/history_dao.dart';
import 'package:zhihu/db/database/entity/history.dart';
import 'package:zhihu/http/api/stories_model.dart';
import 'package:zhihu/model/stories_model.dart';
import 'package:zhihu/routes/app_routes.dart';
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
    dateTime = dateTime.subtract(const Duration(days: 1));
    initialData();
  }

  Future<void> initialData() async {
    final newItems = await ref.read(getListProvider.future);
    final oldItems = await ref.read(getOldListProvider(dateTime).future);
    // 更新状态
    setState(() {
      items = [...newItems, ...oldItems];
    });
  }

  @override
  Widget build(BuildContext context) {
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
          final newItems = await ref.read(getListProvider.future);
          final oldIds = items.map((StoriesData item) => item.id).toList().sublist(0, newItems.length);
          final newIds = newItems.map((StoriesData item) => item.id).toList();
          if (!listEquals(oldIds, newIds)) {
            setState(() {
              items.replaceRange(0, newIds.length, newItems);
            });
          }
        },
        onLoad: () async {
          // 上拉加载
          final moreItems = await ref.read(getOldListProvider(dateTime).future);
          dateTime = dateTime.subtract(const Duration(days: 1));
          setState(() {
            items.addAll(moreItems);
          });
        },
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    final History history = items[index].toHistory(DateTime.now().toString());
                    ref.read(insertSubjectsHistoryProvider(history));
                    context.pushNamed(
                      RoutePath.bodyContent,
                      pathParameters: {"id": items[index].id.toString()},
                      extra: items[index],
                    );
                  },
                  child: Item(item: items[index]),
                ));
          },
        ));
  }
}
