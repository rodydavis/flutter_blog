import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'data/blocs/blocs.dart';
import 'generated/i18n.dart';
import 'ui/common/index.dart';
import 'ui/router.dart';
import 'ui/theme.dart';

final i18n = I18n.delegate;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _observer = AppRouteObserver();
  final _settingsBloc = SettingsBloc();
  final _blogBloc = BlogBloc();

  @override
  void dispose() {
    _settingsBloc.dispose();
    _blogBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _settingsBloc.dispatch(CheckSettings());
    _blogBloc.dispatch(LoadPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(builder: (_) => _settingsBloc),
        BlocProvider<BlogBloc>(builder: (_) => BlogBloc()),
      ],
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is SettingsReady) {
            I18n.locale = state.settings.locale;
          }
        },
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, settingState) => Container(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: settingState is SettingsReady &&
                      settingState.settings.darkMode
                  ? AppTheme.dark
                  : AppTheme.light,
              darkTheme: settingState is SettingsReady &&
                      settingState.settings.useSystemSetting
                  ? AppTheme.dark
                  : null,
              navigatorObservers: [_observer],
              onGenerateTitle: (context) => I18n.of(context).title,
              locale: settingState is SettingsReady
                  ? settingState.settings.locale
                  : Locale("en", "US"),
              localizationsDelegates: [
                i18n,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: i18n.supportedLocales,
              localeResolutionCallback: i18n.resolution(
                fallback: settingState is SettingsReady
                    ? settingState.settings.locale
                    : Locale("en", "US"),
              ),
              onUnknownRoute: (settings) => Router.onUnknownRoute(
                context,
                settings: settings,
              ),
              initialRoute: Router.initialRoute,
              routes: Router.routes,
            ),
          ),
        ),
      ),
    );
  }
}
