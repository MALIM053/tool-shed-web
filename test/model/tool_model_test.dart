import 'package:flutter_test/flutter_test.dart';
import 'package:tool_shed_tracker/model/tool_model.dart';

void main() {
  group('Tool', () {
    test('Tool initialization', () {
      final tool = Tool(name: 'Hammer', type: 'Hand Tool');

      expect(tool.name, 'Hammer');
      expect(tool.type, 'Hand Tool');
    });

    test('Tool properties are correctly set', () {
      final tool = Tool(name: 'Screwdriver', type: 'Hand Tool');

      expect(tool.name, 'Screwdriver');
      expect(tool.type, 'Hand Tool');
    });

    test('Tool equality', () {
      final tool1 = Tool(name: 'Wrench', type: 'Hand Tool');
      final tool2 = Tool(name: 'Wrench', type: 'Hand Tool');
      final tool3 = Tool(name: 'Pliers', type: 'Hand Tool');

      expect(tool1, tool2);
      expect(tool1, isNot(tool3));
    });

    test('Tool hashCode', () {
      final tool1 = Tool(name: 'Wrench', type: 'Hand Tool');
      final tool2 = Tool(name: 'Wrench', type: 'Hand Tool');
      final tool3 = Tool(name: 'Pliers', type: 'Hand Tool');

      expect(tool1.hashCode, tool2.hashCode);
      expect(tool1.hashCode, isNot(tool3.hashCode));
    });
  });
}
