import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/features/main_wrapper/ui/cubit/main_wrapper_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainWrapperCubit, int>(
      builder: (context, state) => BottomNavigationBar(
        backgroundColor: AppColor.orang,
        unselectedItemColor: AppColor.white,
        selectedItemColor: AppColor.black,
        currentIndex: state,
        onTap: (index) =>
            BlocProvider.of<MainWrapperCubit>(context).chnageIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
