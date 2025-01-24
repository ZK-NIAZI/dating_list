import 'package:dating_list/module/dating_list/pages/dating_list_page.dart';
import 'package:flutter/material.dart';

import '../config/themes/light_theme.dart';

class DatingList extends StatelessWidget {
  const DatingList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dating List",
      theme: lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: DatingListPage(),
    );
  }
}
