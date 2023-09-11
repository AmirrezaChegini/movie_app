import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/widgets/loading_widget.dart';
import 'package:movie_app/core/widgets/textbtn.dart';
import 'package:movie_app/features/splash/ui/bloc/splash_block.dart';
import 'package:movie_app/features/splash/ui/bloc/splash_event.dart';
import 'package:movie_app/features/splash/ui/bloc/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<SplashBloc>(context).add(CheckTokenEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/scream.jpg',
              fit: BoxFit.cover,
              width: 300,
              height: 300,
            ),
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: BlocConsumer<SplashBloc, SplashState>(
                builder: (context, state) {
                  if (state is InitSplashState) {
                    return const LoadingWidget();
                  }
                  if (state is NotConnectivitySplashState) {
                    return TextBtn(
                      backgroundColor: AppColor.tranparent,
                      foregroundColor: AppColor.white,
                      ontap: () => BlocProvider.of<SplashBloc>(context)
                          .add(CheckTokenEvent()),
                      child: Text(state.errorMessage),
                    );
                  }

                  return const SizedBox();
                },
                listener: (context, state) {
                  if (state is AuthorizedSplashState) {
                    context.goNamed('main wrapper page');
                  }

                  if (state is NotAuthorizedSplashState) {
                    context.goNamed('login page');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
