import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:wiredash/wiredash.dart';

class WiredDashApp extends StatelessWidget {
  const WiredDashApp({super.key, required this.child, required this.languageCode});
final Widget child;
final String languageCode;
  @override
  Widget build(BuildContext context) {
    return Wiredash(
        projectId: 'movies-app-8i7ar67',
        options: WiredashOptionsData(
          locale: Locale.fromSubtags(
            languageCode: languageCode,
          ),
        ),
        secret: 'Ni8VCrR7exTaJH4g1md7V_X0Y-gadBiv',
        theme: WiredashThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors.royalBlue,
          secondaryColor: AppColors.violet,
          secondaryBackgroundColor: AppColors.vulcan,
        ),
        child: child,
    );
  }
}
