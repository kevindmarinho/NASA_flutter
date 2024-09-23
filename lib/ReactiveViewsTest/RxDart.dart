import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartView extends StatefulWidget {
  const RxDartView({super.key});
 
  @override
  State<RxDartView> createState() => _RxDartViewState();
}
 
class _RxDartViewState extends State<RxDartView> {
  final name = BehaviorSubject.seeded('kevin');
  final surname = BehaviorSubject.seeded('dias');
 
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('RxDart Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<String>(
                stream: Rx.combineLatest2(name, surname, (name, surname) => '$name $surname'),
                builder: (context, snapshot) => Text(snapshot.data ?? ''),
              ),
              ElevatedButton(
                onPressed: () => name.add(name.value == 'Jane' ? 'John' : 'Jane'),
                child: const Text('Change First Name'),
              ),
              ElevatedButton(
                onPressed: () => surname.add(surname.value == 'Doe' ? 'Dop' : 'Doe'),
                child: const Text('Change Surname'),
              ),
            ],
          ),
        ),
      );
 
  @override
  Future<void> dispose() async {
    await name.close();
    await surname.close();
    super.dispose();
  }
}