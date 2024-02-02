import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/DI/get_it.dart';
import 'package:movies_app/common/constance/language.dart';
import 'package:movies_app/common/constance/routes_constance.dart';
import 'package:movies_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/blocs/login/login_bloc.dart';
import 'package:movies_app/presentation/routes.dart';
import 'package:movies_app/presentation/screens/loading/loading_screen.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:movies_app/presentation/widgets/wired_dash_app.dart';
import '../../fade_page_route_builder.dart';
import '../app_localization.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageBloc languageBloc;
  late LoginBloc loginBloc;
  late LoadingBloc loadingBloc;

  @override
  void initState() {
    loginBloc = getItInstance.get<LoginBloc>();
    languageBloc = getItInstance.get<LanguageBloc>();
    loadingBloc = getItInstance.get<LoadingBloc>();
    languageBloc.add(LoadPreferredLanguageEvent());
    super.initState();
  }

  @override
  void dispose() {
    languageBloc.close();
    loginBloc.close();
    loadingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        minTextAdapt: true, designSize: const Size(360, 690));
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>.value(
          value: languageBloc,
        ),
        BlocProvider<LoginBloc>.value(
          value: loginBloc,
        ),
        BlocProvider<LoadingBloc>.value(
          value: loadingBloc,
        ),
      ],
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
                  appBarTheme: AppBarTheme(
                      elevation: 0.0,
                      backgroundColor: AppColors.vulcan,
                      iconTheme: const IconThemeData(color: Colors.white),
                      centerTitle: true,
                      titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp)),
                ),
                builder: (context, child) {
                  return LoadingScreen(screen: child!);
                },
                initialRoute: RoutesList.initial,
                onGenerateRoute: (RouteSettings settings) {
                  final routes = Routes.getRoutes(settings);
                  final WidgetBuilder? builder = routes[settings.name];
                  return FadePageRouteBuilder(builder!, settings);
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
