import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:markdown/markdown.dart' as md;

import '../../plugins/url_launcher/url_launcher.dart';
import '../demos/index.dart';

class MarkdownRender extends StatelessWidget {
  const MarkdownRender({
    Key key,
    @required String html,
  })  : _html = html,
        super(key: key);

  final String _html;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: _html == null
          ? Center(child: CircularProgressIndicator())
          : Scrollbar(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: 900,
                    child: Html(
                      data: md.markdownToHtml(_html),
                      routes: {
                        // -- Demos --
                        TestDemo.routeName: (_) => TestDemo(),
                        PianoFinalDemo.routeName: (_) => PianoFinalDemo(),
                      },
                      padding: EdgeInsets.all(8.0),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      defaultTextStyle: TextStyle(fontFamily: 'serif'),
                      linkStyle: const TextStyle(color: Colors.redAccent),
                      onLinkTap: (url) => UrlUtils.open(url, name: 'Info'),
                      onImageTap: (src) => UrlUtils.open(src, name: 'Preview'),
                      useRichText: true,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
