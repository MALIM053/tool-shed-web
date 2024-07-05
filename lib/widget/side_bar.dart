import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tool_shed_tracker/screen/new_tool_screen.dart';

class Sidebar extends ConsumerWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 200,
      color: Colors.grey[200],
      child: Column(
        children: [
          ListTile(
            title: const Text('Tools'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('New Tool Type'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewToolScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
