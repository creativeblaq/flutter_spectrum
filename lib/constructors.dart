// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Constructors extends HookWidget {
  const Constructors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final areSameSingletons = useState(false);
    final areSameTest = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constructors'),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
