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
