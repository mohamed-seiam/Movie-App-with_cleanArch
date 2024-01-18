import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/DI/get_it.dart';
import 'package:movies_app/common/constance/language.dart';
import 'package:movies_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:movies_app/presentation/widgets/wired_dash_app.dart';
import '../app_localization.dart';
import '../screens/home/home_screen.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageBloc languageBloc;

  @override
  void initState() {
    languageBloc = getItInstance.get<LanguageBloc>();
    super.initState();
  }

  @override
  void dispose() {
    languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        minTextAdapt: true, designSize: const Size(360, 690));
    return BlocProvider<LanguageBloc>.value(
      value: languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredDashApp(
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: const [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                theme: ThemeData(
                  primaryColor: AppColors.vulcan,
                  unselectedWidgetColor: AppColors.royalBlue,
                  colorScheme: ThemeData()
                      .colorScheme
                      .copyWith(secondary: AppColors.royalBlue),
                  scaffoldBackgroundColor: AppColors.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                ),
                home: const HomeScreen(),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
