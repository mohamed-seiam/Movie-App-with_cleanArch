import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

import '../../../../common/constance/size_constance.dart';
import '../../../../data/core/api_constance.dart';
import '../../../../domain/entities/cast_entity.dart';

class CastItem extends StatelessWidget {
  const CastItem({
    super.key,
    required this.castEntity,
  });

  final CastEntity castEntity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.dimen_200.h,
      width: Sizes.dimen_160.w,
      child: Card(
        elevation: 1,
        margin: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_8.w,
          vertical: Sizes.dimen_4.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.dimen_8.w),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Sizes.dimen_8.w),
                ),
                child: CachedNetworkImage(
                  height: Sizes.dimen_200.h,
                  width: Sizes.dimen_160.w,
                  imageUrl:
                  '${ApiConstants.BASE_IMAGE_URL}${castEntity.posterPath}',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.dimen_8.w,
              ),
              child: Text(
                castEntity.name,
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: Theme.of(context).textTheme.vulcanBodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.w,
                bottom: Sizes.dimen_2.h,
              ),
              child: Text(
                castEntity.character,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
