import 'package:fake_async/fake_async.dart';
import 'package:flutter_recipe_app/core/utils/debouncer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Debouncer', () {
    late Debouncer debouncer;
    const delay = Duration(milliseconds: 500);

    setUp(() {
      debouncer = Debouncer(delay: delay);
    });

    test(
        'Given the debouncer is run, ' 
        'When the delay has passed, ' 
        'Then the action should be executed once', () {
      fakeAsync((async) {
        // Given
        int callCount = 0;
        void action() => callCount++;

        // When
        debouncer.run(action);

        // Then: Action should not have been called yet
        expect(callCount, 0);

        // And: When the timer completes
        async.elapse(delay);

        // Then: The action should be executed
        expect(callCount, 1);
      });
    });

    test(
        'Given the debouncer is run multiple times, ' 
        'When the delay has passed since the last call, ' 
        'Then only the last action should be executed', () {
      fakeAsync((async) {
        // Given
        int callCount = 0;
        void action() => callCount++;

        // When: Run is called multiple times within the delay period
        debouncer.run(action);
        async.elapse(const Duration(milliseconds: 100));
        debouncer.run(action);
        async.elapse(const Duration(milliseconds: 200));
        debouncer.run(action);

        // Then: The action should not have been called yet
        expect(callCount, 0);

        // And: When the final delay completes
        async.elapse(delay);

        // Then: Only the last action is executed
        expect(callCount, 1);
      });
    });

    test(
        'Given the debouncer is run and then cancelled, ' 
        'When the delay has passed, ' 
        'Then the action should not be executed', () {
      fakeAsync((async) {
        // Given
        int callCount = 0;
        void action() => callCount++;

        // When
        debouncer.run(action);
        debouncer.cancel();

        // And: The timer duration elapses
        async.elapse(delay);

        // Then: The action should not have been called
        expect(callCount, 0);
      });
    });

    test(
        'Given a new action is run, ' 
        'When the previous timer is still active, ' 
        'Then the previous action should be cancelled', () {
      fakeAsync((async) {
        // Given
        int firstActionCallCount = 0;
        void firstAction() => firstActionCallCount++;

        int secondActionCallCount = 0;
        void secondAction() => secondActionCallCount++;

        // When: The first action is run
        debouncer.run(firstAction);

        // And: Before the delay completes, the second action is run
        async.elapse(const Duration(milliseconds: 100));
        debouncer.run(secondAction);

        // And: The timer completes
        async.elapse(delay);

        // Then: The first action was cancelled, and the second was executed
        expect(firstActionCallCount, 0);
        expect(secondActionCallCount, 1);
      });
    });
  });
}