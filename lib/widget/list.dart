import 'package:flutter/material.dart';
import 'package:zhihu/widget/network_img.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.title,
    required this.hint,
    this.image,
    this.onTap,
  });

  final String title;
  final String hint;
  final String? image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 2),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: SizedBox(
              height: 108,
              child: Padding(
                  padding: const EdgeInsets.only(top: 2, left: 3, right: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // 主要文本
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
                            child: Text(title,
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(hint,
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.grey, fontSize: 13.0)),
                        ))
                      ])))),
      if (image != null)
        NetworkImg(
          src: image,
          width: 80,
          height: 80,
          radius: 2.0,
          fit: BoxFit.cover,
        )
            ])));
  }
}
