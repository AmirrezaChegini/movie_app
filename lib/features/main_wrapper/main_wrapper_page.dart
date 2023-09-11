import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/account/ui/account_page.dart';
import 'package:movie_app/features/main_wrapper/ui/cubit/main_wrapper_cubit.dart';
import 'package:movie_app/features/main_wrapper/ui/widgets/bottom_nav_bar.dart';
import 'package:movie_app/features/movies/ui/movies_page.dart';

class MainWrapperPage extends StatelessWidget {
  const MainWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: BlocBuilder<MainWrapperCubit, int>(
        builder: (context, state) => IndexedStack(
          index: state,
          children: const [
            AccountPage(),
            MoviesPage(),
          ],
        ),
      ),
    );
  }
}
