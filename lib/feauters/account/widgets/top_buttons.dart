import 'package:amazon_clone_me/feauters/account/widgets/account_butotn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders',
              onTab: () {},
            ),
            AccountButton(
              text: 'Turn Seller',
              onTab: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              text: 'Log Out',
              onTab: () {},
            ),
            AccountButton(
              text: 'Your Wish List',
              onTab: () {},
            ),
          ],
        ),
      ],
    );
  }
}
