import 'package:flutter/material.dart';

class ValueNotifierView extends StatefulWidget {
  const ValueNotifierView({super.key});

  @override
  State<ValueNotifierView> createState() => _ValueNotifierViewState();
}

class _ValueNotifierViewState extends State<ValueNotifierView> {
  final ValueNotifier<String> name = ValueNotifier('Jane');
  final ValueNotifier<String> surname = ValueNotifier('Doe');
  late final ValueNotifier<String> fullName;

  @override
  void initState() {
    super.initState();
    fullName = ValueNotifier('${name.value} ${surname.value}');

    name.addListener(_updateFullName);
    surname.addListener(_updateFullName);
  }

  /// This ensures that changing first or surname triggers
  /// a rebuild
  void _updateFullName() {
    fullName.value = '${name.value} ${surname.value}';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('ValueNotifier Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ValueListenableBuilder<String>(
                valueListenable: fullName,
                builder: (context, value, child) => Text(
                  '${name.value} ${surname.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              ElevatedButton(
                onPressed: () =>
                    name.value = name.value == 'Jane' ? 'John' : 'Jane',
                child: const Text('Change First Name'),
              ),
              ElevatedButton(
                onPressed: () =>
                    surname.value = surname.value == 'Doe' ? 'Dop' : 'Doe',
                child: const Text('Change Surname'),
              ),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    name.dispose();
    surname.dispose();
    super.dispose();
  }
}