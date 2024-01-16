import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/presentation/widgets/logo.dart';

import 'navigation_drawer_list_item.dart';
import 'navigation_expanded_list_tile.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w,
      decoration: BoxDecoration(
        boxShadow:[
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
                padding:EdgeInsets.only(
                  top: Sizes.dimen_8.h,
                  bottom: Sizes.dimen_18.h,
                  left: Sizes.dimen_8.w,
                  right: Sizes.dimen_8.w,
                ),
              child: Logo(height: Sizes.dimen_32.h),
            ),
            NavigationListItem(
              title:'Favourite Movies',
              onPressed: (){},
            ),
            NavigationExpandedListItem(
              children: const [
                'English',
                'Spanish',
              ],
              title:'Language',
              onPressed: (){},
            ),
            NavigationListItem(
              title:'Feedback',
              onPressed: (){},
            ),
            NavigationListItem(
              title:'About',
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
