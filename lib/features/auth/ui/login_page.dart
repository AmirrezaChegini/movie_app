import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/features/auth/ui/cubit/pass_visible_cubit.dart';
import 'package:movie_app/features/auth/ui/widgets/textbtn_auth.dart';
import 'package:movie_app/features/auth/ui/widgets/textfield_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 60),
              ),
              const SizedBox(height: 25),
              TextFieldAuth(
                hint: 'Email',
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validate: (value) {},
              ),
              const SizedBox(height: 10),
              BlocBuilder<PassVisibleCubit, bool>(
                builder: (context, state) => TextFieldAuth(
                  hint: 'Password',
                  isObsecure: state,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  suffixIcon: state
                      ? GestureDetector(
                          onTap: () {
                            BlocProvider.of<PassVisibleCubit>(context)
                                .chnageVisibility(false);
                          },
                          child: const Icon(Icons.visibility_off),
                        )
                      : GestureDetector(
                          onTap: () {
                            BlocProvider.of<PassVisibleCubit>(context)
                                .chnageVisibility(true);
                          },
                          child: const Icon(Icons.visibility),
                        ),
                  validate: (value) {},
                ),
              ),
              const SizedBox(height: 25),
              TextBtnAuth(
                ontap: () {},
                backgroundColor: AppColor.orang,
                foregroundColor: AppColor.white,
                child: 'Login',
              ),
              const SizedBox(height: 10),
              TextBtnAuth(
                ontap: () {
                  context.goNamed('sign page');
                },
                backgroundColor: AppColor.white,
                foregroundColor: AppColor.orang,
                child: 'Don\'t have an acoount? Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
