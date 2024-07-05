import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tool_shed_tracker/tool_model.dart';

class ToolNotifier extends Notifier<List<Tool>> {
  @override
  List<Tool> build() {
    return [];
  }

  void addTool(Tool tool) {
    state = [...state, tool];
  }

  void removeTool(Tool tool) {
    state = state.where((t) => t != tool).toList();
  }
}

final toolProvider =
    NotifierProvider<ToolNotifier, List<Tool>>(ToolNotifier.new);
