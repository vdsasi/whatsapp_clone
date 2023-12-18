import 'package:flutter/material.dart';

class StatusUpdateIndicator extends StatelessWidget {
  final List<StatusUpdate> statusUpdates;

  const StatusUpdateIndicator({Key? key, required this.statusUpdates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: statusUpdates.where((update) => update.isNew).map((update) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 12.0,
            height: 12.0,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class StatusUpdate {
  final String userId;
  final DateTime updateTime;
  final bool isNew;

  const StatusUpdate(
      {required this.userId, required this.updateTime, required this.isNew});
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    final List<StatusUpdate> statusUpdates = [
      StatusUpdate(userId: '1', updateTime: DateTime.now(), isNew: true),
      StatusUpdate(
          userId: '2',
          updateTime: DateTime.now().subtract(const Duration(minutes: 10)),
          isNew: false),
      StatusUpdate(
          userId: '3',
          updateTime: DateTime.now().subtract(const Duration(hours: 1)),
          isNew: false),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Clone'),
        actions: [
          StatusUpdateIndicator(statusUpdates: statusUpdates),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final StatusUpdate statusUpdate = statusUpdates[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://picsum.photos/200/300?image=${index + 1}'),
            ),
            title: Text('User ${statusUpdate.userId}'),
            subtitle: Text(statusUpdate.updateTime.toString()),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: statusUpdates.length,
      ),
    );
  }
}
