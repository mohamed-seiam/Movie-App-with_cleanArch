import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/presentation/blocs/searched_movie/searched_movie_bloc.dart';

import '../screens/search/custom_search_movie.dart';
import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    return Padding(
      padding: EdgeInsets.only(
        top: screenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/svg/menu.svg',
              height: Sizes.dimen_18.h,
            ),
          ),
          const Expanded(
            child: Logo(
              height: Sizes.dimen_18,
            ),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate:CustomSearchDelegate(BlocProvider.of<SearchedMovieBloc>(context)),
              );
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_20.h,
            ),
          ),
        ],
      ),
    );
  }
}
