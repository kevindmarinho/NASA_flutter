import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../Stores/nameStore.dart'; 



class MobXView extends StatefulWidget {
  const MobXView({super.key});

  @override
  State<MobXView> createState() => _MobXViewState();
}

class _MobXViewState extends State<MobXView> {
  final store = NameStore();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('MobX Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(
                builder: (_) => Text(store.fullName),
              ),
              ElevatedButton(
                onPressed: store.changeFirstName,
                child: const Text('Change First Name'),
              ),
              ElevatedButton(
                onPressed: store.changeSurname,
                child: const Text('Change Surname'),
              ),
              ElevatedButton(
                onPressed: store.changeMiddleName,
                child: const Text('Reset First Name'),
              ),
            ],
          ),
        ),
      );
}