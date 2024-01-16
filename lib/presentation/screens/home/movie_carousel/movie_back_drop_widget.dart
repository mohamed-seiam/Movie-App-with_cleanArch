import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/data/core/api_constance.dart';
import 'package:movies_app/presentation/blocs/movie_backfrop_bloc/movie_back_drop_bloc.dart';

class MovieBackDropWidget extends StatelessWidget {
  const MovieBackDropWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.7,
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(Sizes.dimen_40.w)),
        child: Stack(
          children: [
            FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: BlocBuilder<MovieBackDropBloc, MovieBackDropState>(
                  builder: (context, state) {
                if (state is MovieBackdropCHanged) {
                  return CachedNetworkImage(
                    imageUrl:
                        '${ApiConstants.BASE_IMAGE_URL}${state.movieEntity.backDropPath}',
                    fit: BoxFit.fitHeight,
                  );
                }
                return const SizedBox.shrink();
              }),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 1,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
