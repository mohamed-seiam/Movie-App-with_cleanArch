import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/screens/loading/loading_circle.dart';

import '../../../common/constance/size_constance.dart';
import '../../themes/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key, required this.screen});

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc,LoadingState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen,
            if (state is LoadingStarting)
            Container(
              decoration: BoxDecoration(
                color: AppColors.vulcan.withOpacity(.8),
              ),
              child: Center(
                child: LoadingCircle(
                  size: Sizes.dimen_200.w,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
