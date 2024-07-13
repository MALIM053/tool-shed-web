import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tool_shed_tracker/core/provider/sidebar_provider.dart';

void main() {
  group('sidebarCollapsedProvider', () {
    test('initial state is true', () {
      final container = ProviderContainer();
      final state = container.read(sidebarCollapsedProvider);

      expect(state, true);
    });

    test('state can be updated to false', () {
      final container = ProviderContainer();
      final notifier = container.read(sidebarCollapsedProvider.notifier);

      notifier.state = false;

      final state = container.read(sidebarCollapsedProvider);

      expect(state, false);
    });

    test('state can be toggled', () {
      final container = ProviderContainer();
      final notifier = container.read(sidebarCollapsedProvider.notifier);

      notifier.state = !notifier.state;

      final state = container.read(sidebarCollapsedProvider);

      expect(state, false);

      notifier.state = !notifier.state;

      final newState = container.read(sidebarCollapsedProvider);

      expect(newState, true);
    });
  });
}
