import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/blocs/cast/cast_crew_bloc.dart';
import '../../../../common/constance/size_constance.dart';
import 'cast_item.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCrewBloc, CastCrewState>(
      builder: (context, state) {
        if (state is CastLoaded) {
          return SizedBox(
            height: Sizes.dimen_200.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.casts.length,
              itemBuilder: (context, index) {
                final castEntity = state.casts[index];
                return CastItem(castEntity: castEntity);
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

