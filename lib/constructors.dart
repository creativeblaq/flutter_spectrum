import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spectrum/constructors/models.dart';
import 'package:flutter_spectrum/constructors/widgets.dart';

class Constructors extends HookWidget {
  const Constructors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSameSingleton = useState(false);
    final isSameSingletonID = useState(false);
    Map<String, dynamic> userData = {'id': 1, 'username': 'John Doe'};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Constructors'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Factory Contructors',
              style: Theme.of(context).textTheme.titleLarge),
          const Divider(),
          Text('1. Singleton Factory',
              style: Theme.of(context).textTheme.titleMedium),
          Text('Is same singleton: ${isSameSingleton.value}'),
          Text('Is same singleton ID: ${isSameSingletonID.value}'),
          ElevatedButton(
            onPressed: () {
              ConfigurationManager m1 = ConfigurationManager();
              ConfigurationManager m2 = ConfigurationManager();

              m2.databaseUrl = 'localhost:5433/mydb';
              m2.logLevel = 3;

              isSameSingleton.value = m1 == m2;
              isSameSingletonID.value = identical(m1, m2);
            },
            child: const Text('Test Config manager'),
          ),
          const SizedBox(height: 24),
          Text('2. JSON Parsing',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text('$userData'),
          Text('${User.fromJson(userData)}'),
          const SizedBox(height: 56),
          Text('Named Constructors',
              style: Theme.of(context).textTheme.titleLarge),
          const Divider(),
          const AppText.subHeading('1. Custom text widget'),
          AppText(
            'Custom text widget normal',
            Theme.of(context).textTheme.bodySmall!,
          ),
          const SizedBox(height: 56),
          const AppText.heading('Factory vs Named Constructors'),
          const Divider(),
          const SizedBox(height: 24),
          const CustomButton.outlined('Outlined Named Constructor'),
          const CustomButton.filled('Filled Named Constructor'),
          CustomFactoryButton.outlined('Outlined Factory Constructor'),
          CustomFactoryButton.filled('Filled Factory Constructor'),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
