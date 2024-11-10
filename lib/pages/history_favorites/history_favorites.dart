import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zhihu/db/database/dao/history_dao.dart';
import 'package:zhihu/db/database/dao/stars_dao.dart';
import 'package:zhihu/db/database/entity/history.dart';
import 'package:zhihu/widget/list.dart';

import '../../db/database/entity/stars.dart';
import '../../routes/app_routes.dart';

class HistoryFavorites extends ConsumerWidget {
  final String title;

  const HistoryFavorites({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final List<Stars> items = title == "历史记录"
        ? ref.watch(findAllSubjectsHistoryProvider).value ?? []
        : ref.watch(findAllSubjectsStarsProvider).value ?? [];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(title),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                final History history =
                    items[index].toHistory(DateTime.now().toString());
                ref.read(insertSubjectsHistoryProvider(history));
                context.pushNamed(
                  RoutePath.bodyContent,
                  pathParameters: {"id": items[index].id.toString()},
                  extra: items[index],
                );
              },
              child: Item(
                title: items[index].title,
                hint: items[index].hint ?? "",
                image: items[index].image ?? "",
              ),
            ),
          );
        },
      ),
    );
  }
}
