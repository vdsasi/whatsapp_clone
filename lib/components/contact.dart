/*
This represent the contacts on Chats Screen
*/

import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 30, height: 20),
        Expanded(
          flex: 1,
          child: FractionallySizedBox(
            heightFactor: 0.6,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              child: Image.asset(
                'assets/images/default_profile_image.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
          height: 20,
        ),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  child: const Text(
                    "Deepthi Sasidhar Vasamsetti Vasamsetti",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  child: const Text(
                    "New message is the new message is new message",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 30, height: 20),
      ],
    );
  }
}
