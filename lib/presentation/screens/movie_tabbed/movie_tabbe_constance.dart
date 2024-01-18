import 'package:movies_app/common/constance/translation_constance.dart';
import 'package:movies_app/presentation/screens/movie_tabbed/tab.dart';

class MovieTabbedConstants {
  static const List<Tab> movieTabs =  [
    Tab(index: 0, title: TranslationConstance.popular),
    Tab(index: 1, title: TranslationConstance.now),
    Tab(index: 2, title: TranslationConstance.soon),
  ];
}