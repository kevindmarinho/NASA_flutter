import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// void main() => runApp(const ProviderScope(child: MyApp()));

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) => const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: RiverPodView(),
//       );
// }

//Notice that these providers are at the top-level
//You don't manage these like normal variables in Riverpod
final nameProvider = StateProvider<String>((ref) => 'Jane');
final surnameProvider = StateProvider<String>((ref) => 'Doe');
final fullNameProvider = StateProvider<String>((ref) {
  final name = ref.watch(nameProvider);
  final surname = ref.watch(surnameProvider);
  return '$name  $surname';
});


class RiverPodView extends ConsumerWidget {
  const RiverPodView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                ref.watch(fullNameProvider),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () => ref.read(nameProvider.notifier).state =
                    ref.read(nameProvider) == 'Jane' ? 'John' : 'Jane',
                child: const Text('Change First Name'),
              ),
              ElevatedButton(
                onPressed: () => ref.read(surnameProvider.notifier).state =
                    ref.read(surnameProvider) == 'Doe' ? 'Dop' : 'Doe',
                child: const Text('Change Surname'),
              ),
            ],
          ),
        ),
      );
}