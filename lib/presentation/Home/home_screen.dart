import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tool_shed_tracker/core/provider/sidebar_provider.dart';
import 'package:tool_shed_tracker/presentation/Home/widget/side_bar.dart';
import 'widget/tool_list.dart';



class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSidebarCollapsed = ref.watch(sidebarCollapsedProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tool Shed Tracker'),
      ),
      body: Row(
        children: [
          if (!isSidebarCollapsed || screenWidth > 700) const Sidebar(),
          const Expanded(
            child: ToolList(),
          ),
        ],
      ),
      floatingActionButton: screenWidth <= 700
          ? FloatingActionButton(
              onPressed: () {
                ref.read(sidebarCollapsedProvider.notifier).state =
                    !isSidebarCollapsed;
              },
              child: Icon(isSidebarCollapsed ? Icons.menu : Icons.close),
            )
          : null,
    );
  }
}
