import 'package:flutter/material.dart';

import '../../generated/i18n.dart';
import '../../r.dart';
import 'index.dart';

class PrivacyPolicy extends StatelessWidget {
  static const String routeName = "/privacy_policy";

  @override
  Widget build(BuildContext context) {
    return AssetPageRender(
      title: I18n.of(context).privacy_policy,
      path: R.assetsPagesPrivacyPolicy,
    );
  }
}
