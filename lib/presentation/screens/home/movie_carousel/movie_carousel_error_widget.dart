import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/common/constance/translation_constance.dart';
import 'package:movies_app/common/extensions/string_extension.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(
      {super.key, required this.errorType, required this.onPressed,});

  final AppErrorType errorType;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstance.somethingWentWrong.t(context)
                : TranslationConstance.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ButtonBar(
            children: [
              AppButton(
                text: TranslationConstance.retry,
                onPressed: () => onPressed(),
              ),
              AppButton(
                text: TranslationConstance.feedback,
                onPressed: () => Wiredash.of(context).show(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
