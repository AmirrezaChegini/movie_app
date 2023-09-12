import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/colors.dart';
import 'package:movie_app/core/widgets/loading_widget.dart';
import 'package:movie_app/core/widgets/textbtn.dart';
import 'package:movie_app/features/account/ui/bloc/user_bloc.dart';
import 'package:movie_app/features/account/ui/bloc/user_event.dart';
import 'package:movie_app/features/account/ui/bloc/user_state.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<Userbloc>(context).add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<Userbloc, UserState>(
        builder: (context, state) {
          if (state is LoadingUserState) {
            return const LoadingWidget();
          }

          if (state is FailUserState) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 100,
                right: 100,
              ),
              child: TextBtn(
                backgroundColor: AppColor.tranparent,
                foregroundColor: AppColor.white,
                ontap: () =>
                    BlocProvider.of<Userbloc>(context).add(GetUserEvent()),
                child: Text(state.errorMessage),
              ),
            );
          }

          if (state is CompleteUserState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'ID: ',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 30),
                    children: [
                      TextSpan(
                        text: '${state.user.id}',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 26),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'USERNAME: ',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 30),
                    children: [
                      TextSpan(
                        text: state.user.username,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 26),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'EMAIL: ',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 30),
                    children: [
                      TextSpan(
                        text: state.user.email,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 26),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'CREATED_AT: ',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 30),
                    children: [
                      TextSpan(
                        text: state.user.created,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 26),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'UPDATED_AT: ',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 30),
                    children: [
                      TextSpan(
                        text: state.user.updated,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 26),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
