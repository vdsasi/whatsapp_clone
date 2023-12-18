import 'package:flutter/material.dart';
import 'package:whatsapp_clone/components/dotted_border_example.dart';
import 'package:whatsapp_clone/components/my_status.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> userData = [
      {
        'name': 'Sasi',
        'time': '12 minutes ago',
        'numberOfStories': '1',
        'numberOfWatchedStories': '0'
      },
      {
        'name': 'Sasidhar',
        'time': '21 minutes ago',
        'numberOfStories': '4',
        'numberOfWatchedStories': '2'
      },
    ];

    return Column(
      children: [
        const SizedBox(
          height: 100,
          child: MyStatus(),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: userData.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
            itemBuilder: (context, index) {
              return Row(
                children: [
                  const SizedBox(width: 22),
                  DottedBorderExample(
                    numberOfStories:
                        int.parse(userData[index]['numberOfStories']!),
                    numberOfWatchedStories:
                        int.parse(userData[index]['numberOfWatchedStories']!),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData[index]['name']!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 17.0,
                          ),
                        ),
                        Text(
                          userData[index]['time']!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
