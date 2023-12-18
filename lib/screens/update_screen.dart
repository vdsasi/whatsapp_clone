/* This represents the Updates Screen
*/

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/components/DottedBorderExample.dart';
import 'package:whatsapp_clone/components/my_status.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: MyStatus(),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 80,
          child: DottedBorderExample(
            numberOfStories: 4,
            numberOfWatchedStories: 2,
          ),
        )
      ],
    );
  }
}
