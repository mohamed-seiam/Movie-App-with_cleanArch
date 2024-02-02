  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/presentation/screens/login/widgets/login_form.dart';
import 'package:movies_app/presentation/widgets/logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                  padding:EdgeInsets.only(top: Sizes.dimen_32.h),
                child: Logo(height:Sizes.dimen_64.h),
              ),
             const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
