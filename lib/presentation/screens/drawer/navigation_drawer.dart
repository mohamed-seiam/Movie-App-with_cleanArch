import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/language.dart';
import 'package:movies_app/common/constance/routes_constance.dart';
import 'package:movies_app/common/constance/sections.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/common/constance/translation_constance.dart';
import 'package:movies_app/common/extensions/string_extension.dart';
import 'package:movies_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movies_app/presentation/screens/section/section_screen_arguments.dart';
import 'package:movies_app/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

import '../../widgets/app_dialog.dart';
import 'navigation_drawer_list_item.dart';
import 'navigation_expanded_list_tile.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h,
                bottom: Sizes.dimen_18.h,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.w,
              ),
              child: Logo(height: Sizes.dimen_32.h),
            ),
            NavigationListItem(
              title: TranslationConstance.favoriteMovies.t(context),
              onPressed: () {
                Navigator.pushNamed(context, RoutesList.favorite);
              },
            ),
            NavigationExpandedListItem(
              children: Languages.languages.map((e) => e.value).toList(),
              title: TranslationConstance.language.t(context),
              onPressed: (index) {
                context.read<LanguageBloc>().add(ToggleLanguageEvent(
                    languageEntity: Languages.languages[index]));
              },
            ),
            NavigationExpandedListItem(
              children: Sections.sections.map((e) => e.name).toList(),
              title: TranslationConstance.section.t(context),
              onPressed: (index) {
                Navigator.pushNamed(
                  context,
                  RoutesList.section,
                  arguments: SectionMoviesArguments(
                      title: Sections.sections[index].name, index: index),
                );
              },
            ),
            NavigationListItem(
              title: TranslationConstance.feedback.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: TranslationConstance.about.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                _showDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: TranslationConstance.about,
        buttonText: TranslationConstance.okay,
        description: TranslationConstance.aboutDescription,
        image: Image.asset(
          'assets/pngs/tmdb_logo.png',
          height: Sizes.dimen_32.h,
        ),
      ),
    );
  }
}
