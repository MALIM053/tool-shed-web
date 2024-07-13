import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tool_shed_tracker/core/provider/tool_provider.dart';
import 'package:tool_shed_tracker/model/tool_model.dart';

void main() {
  group('ToolNotifier', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
      addTearDown(container.dispose);
    });

    test('initial state is an empty list', () {
      final tools = container.read(toolProvider);

      expect(tools, []);
    });

    test('addTool adds a tool to the state', () {
      final notifier = container.read(toolProvider.notifier);
      final tool = Tool(name: 'Hammer', type: 'Hand Tool');

      notifier.addTool(tool);

      final tools = container.read(toolProvider);

      expect(tools, [tool]);
    });

    test('removeTool removes a tool from the state', () {
      final notifier = container.read(toolProvider.notifier);
      final tool1 = Tool(name: 'Hammer', type: 'Hand Tool');
      final tool2 = Tool(name: 'Screwdriver', type: 'Hand Tool');

      notifier.addTool(tool1);
      notifier.addTool(tool2);

      notifier.removeTool(tool1);

      final tools = container.read(toolProvider);

      expect(tools, [tool2]);
    });

    test('addTool adds multiple tools to the state', () {
      final notifier = container.read(toolProvider.notifier);
      final tool1 = Tool(name: 'Hammer', type: 'Hand Tool');
      final tool2 = Tool(name: 'Screwdriver', type: 'Hand Tool');

      notifier.addTool(tool1);
      notifier.addTool(tool2);

      final tools = container.read(toolProvider);

      expect(tools, [tool1, tool2]);
    });

    test('removeTool does nothing if the tool is not in the state', () {
      final notifier = container.read(toolProvider.notifier);
      final tool1 = Tool(name: 'Hammer', type: 'Hand Tool');
      final tool2 = Tool(name: 'Screwdriver', type: 'Hand Tool');

      notifier.addTool(tool1);

      notifier.removeTool(tool2);

      final tools = container.read(toolProvider);

      expect(tools, [tool1]);
    });
  });
}
