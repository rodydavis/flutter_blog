import 'package:flutter/material.dart';

import '../../generated/i18n.dart';
import '../common/index.dart';

class BlogScreen extends StatelessWidget {
  static const String routeName = '/blog';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: I18n.of(context).blogTitle,
      // appBar: AppBar(
      //   title: Text(I18n.of(context).blogTitle),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.add),
      //       onPressed: () =>
      //           navigate(context, EditPostScreen(), fullScreen: true),
      //     ),
      //   ],
      // ),
      body: BlogCards(),
    );
  }
}
