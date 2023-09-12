import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/widgets/app_snackbar.dart';
import 'package:movie_app/core/widgets/loading_widget.dart';
import 'package:movie_app/features/auth/ui/bloc/auth_bloc.dart';
import 'package:movie_app/features/auth/ui/bloc/auth_event.dart';
import 'package:movie_app/features/auth/ui/bloc/auth_state.dart';
import 'package:movie_app/features/auth/ui/cubit/pass_visible_cubit.dart';
import 'package:movie_app/core/widgets/textbtn.dart';
import 'package:movie_app/features/auth/ui/widgets/textfield_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFieldAuth(
                      hint: 'Email',
                      controller: _emailCtrl,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validate: (value) {
                        bool isMatch = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);

                        if (value.isEmpty) {
                          return 'Enter your email address';
                        } else if (!isMatch) {
                          return 'Enter correct email format';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<PassVisibleCubit, bool>(
                      builder: (context, state) => TextFieldAuth(
                        hint: 'Password',
                        controller: _passwordCtrl,
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
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be 6 chracters';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              TextBtn(
                ontap: () {
                  if (_formkey.currentState!.validate()) {
                    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                      _emailCtrl.text,
                      _passwordCtrl.text,
                    ));
                  }
                },
                backgroundColor: AppColor.orang,
                foregroundColor: AppColor.white,
                child: BlocConsumer<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is LoadingAuthState) {
                      return const LoadingWidget();
                    } else {
                      return const Text('Login');
                    }
                  },
                  listener: (context, state) {
                    if (state is CompleteAuthState) {
                      context.goNamed('main wrapper page');
                    }

                    if (state is FailAuthState) {
                      showMessage(context, state.errorMessage);
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              TextBtn(
                ontap: () {
                  context.goNamed('sign page');
                },
                backgroundColor: AppColor.white,
                foregroundColor: AppColor.orang,
                child: const Text('Don\'t have an acoount? Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
