import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tool_shed_tracker/core/provider/tool_provider.dart';
import 'package:tool_shed_tracker/model/tool_model.dart';

class NewToolScreen extends ConsumerWidget {
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();

  NewToolScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Tool'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Tool Name'),
            ),
            TextField(
              controller: _typeController,
              decoration: const InputDecoration(labelText: 'Tool Type'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final type = _typeController.text;

                if (name.isNotEmpty && type.isNotEmpty) {
                  ref
                      .read(toolProvider.notifier)
                      .addTool(Tool(name: name, type: type));
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Tool'),
            ),
          ],
        ),
      ),
    );
  }
}
