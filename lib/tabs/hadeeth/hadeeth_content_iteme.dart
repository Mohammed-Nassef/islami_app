import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_style.dart';

class HadeethContentIteme extends StatelessWidget {
  const HadeethContentIteme(
      {super.key, required this.index, required this.contentHadeethList});
  final int index;
  final List<String> contentHadeethList;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      contentHadeethList[index],
      style: AppStyle.boldPrimarycolor20,
    );
  }
}
