import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/colors.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
          color: AppColor.blueGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TIME',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    '140 min',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'RATED',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    'PG-13',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GENRE',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    'Comdedy, drama, music',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'RELEASE DATE',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    '14 Oct 1994',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
