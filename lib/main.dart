// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: MyHomePage(title: 'Flutter Demo Home Page'));
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   final String title;
//
//   const MyHomePage({super.key, required this.title});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0; // local state, no service, no injection
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

///------------------------use dependency injection
// UI does not know how ApiService is created
//
// You can pass a real service in production
//
// You can pass a mock service in tests
//
// You can control one instance across the app
//
// Your architecture becomes Clean, testable, professional
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CounterService.dart';

void main() {
  final counterService = CounterService(); // dependency
  runApp(MyApp(counterService: counterService));
}

class MyApp extends StatelessWidget {
  final CounterService counterService;

  const MyApp({super.key, required this.counterService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        counterService: counterService,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final CounterService counterService;

  const MyHomePage({
    super.key,
    required this.title,
    required this.counterService,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {
      widget.counterService.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '${widget.counterService.state.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
