import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/common/constance/routes_constance.dart';
import 'package:movies_app/common/constance/size_constance.dart';
import 'package:movies_app/common/constance/translation_constance.dart';
import 'package:movies_app/common/extensions/string_extension.dart';
import 'package:movies_app/presentation/blocs/login/login_bloc.dart';
import 'package:movies_app/presentation/screens/login/widgets/label_field_widget.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:movies_app/presentation/widgets/button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _userNameController, _passwordController;
  bool enableSignIn = false;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _userNameController.addListener(() {
      setState(() {
        enableSignIn = _userNameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        enableSignIn = _userNameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_32.w,
          vertical: Sizes.dimen_24.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.dimen_8.h),
              child: Text(
                TranslationConstance.loginToMovieApp.t(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            LabelFieldWidget(
              label: TranslationConstance.username.t(context),
              isPasswordField: false,
              controller: _userNameController,
              hintText: TranslationConstance.enterTMDbUsername.t(context),
            ),
            LabelFieldWidget(
              label: TranslationConstance.password.t(context),
              isPasswordField: true,
              controller: _passwordController,
              hintText: TranslationConstance.enterPassword.t(context),
            ),
            BlocConsumer<LoginBloc, LoginState>(
              listenWhen: (previous, current) => current is LoginSuccess,
              buildWhen: (previous, current) => current is LoginError,
              builder: (context, state) {
                if (state is LoginError) {
                  return Text(
                    state.errorMessage.t(context),
                    style: Theme.of(context).textTheme.orangeSubtitle1,
                  );
                }
                return const SizedBox.shrink();
              },
              listener: (context, state) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesList.homeScreen, (route) => false);
              },
            ),
            SizedBox(height: Sizes.dimen_10.h,),
            AppButton(
              text: TranslationConstance.signIn,
              isEnabled: enableSignIn,
              onPressed: () {
                if (enableSignIn == true) {
                  BlocProvider.of<LoginBloc>(context).add(
                    LoginInitialEvent(
                      userName: _userNameController.text,
                      password: _passwordController.text,
                    ),
                  );
                } else {
                  return;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
