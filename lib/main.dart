import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/DI/get_it.dart' as getIt;
import 'package:movies_app/data/tables/movie_table.dart';
import 'package:movies_app/presentation/widgets/movie_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'common/constance/bloc_observable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  unawaited(
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  );
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MovieTableAdapter());
  unawaited(getIt.init());
  Bloc.observer = MyBlocObserver();
  runApp(const MovieApp());
}
