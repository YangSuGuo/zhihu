import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zhihu/widget/list.dart';

import '../../db/database/dao/history_dao.dart';
import '../../db/database/entity/history.dart';
import '../../routes/app_routes.dart';
import 'daily_provider.dart';

class Daily extends ConsumerWidget {
  const Daily({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyReportState = ref.watch(dailyReportStateProvider);

    return dailyReportState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (items) => EasyRefresh(
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
                await ref.read(dailyReportStateProvider.notifier).refresh();
              },
              onLoad: () async {
                await ref.read(dailyReportStateProvider.notifier).loadMore();
              },
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Item(
                      title: item.title,
                      hint: item.hint ?? "",
                      image: item.image,
                      onTap: () {
                        final History history =
                            items[index].toHistory(DateTime.now().toString());
                        ref.read(insertSubjectsHistoryProvider(history));
                        context.pushNamed(
                          RoutePath.bodyContent,
                          pathParameters: {"id": items[index].id.toString()},
                      extra: items[index],
                    );
                      });
                },
              ),
            ));
  }
}
