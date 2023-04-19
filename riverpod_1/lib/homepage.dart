/* Stateless widget (ConsumerWidget) for Riverpod

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final mycounter = StateProvider((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverpodTest"),
        centerTitle: true,
        actions: [],
      ),
      body: Center(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, _) {
                final count = ref
                    .watch(mycounter); //watching the StateProvider for change
                return Text('$count');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(mycounter.notifier).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}

*/

//Stateful widget (ConsumerStateful) widget for Riverpod
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mycounter = StateProvider((ref) => 0);

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverPod"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(mycounter);
                return Text('$count');
              },
            ),
          ],
        ),
      ),

      //floating button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(mycounter.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
