import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/DI/get_it.dart' as getIt;
import 'package:movies_app/presentation/widgets/movie_app.dart';

import 'common/constance/bloc_observable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  unawaited(
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  );
  unawaited(getIt.init());
  Bloc.observer = MyBlocObserver();
  runApp(const MovieApp());
}
