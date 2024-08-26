import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './controllers/counter_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final theme = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialApp(
          theme: ThemeData(
            brightness: theme.isDark.value ? Brightness.dark : Brightness.light,
            appBarTheme: AppBarTheme(
              backgroundColor: theme.isDark.value ? Color.fromARGB(255, 162, 42, 180) : Color.fromARGB(255, 15, 133, 243),
            ),
          ),
          home: HomePage(),
        ));
  }
}


class HomePage extends StatelessWidget {
  final counterC = Get.find<CounterController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Flutter", style: TextStyle(fontSize: 30),),
            IconButton(
              icon: Icon(Icons.bedtime_sharp),
              onPressed: () {
                counterC.ChangeTheme();
              },
            )
          ],
        ),
      ),
      body:  Center(
        child: Obx(
          () => Text(
            "Angka ${counterC.counter}",
            style: TextStyle(fontSize: 35),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => counterC.increment(),
          ),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () => counterC.decrement(),
          ),
          FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: () => counterC.reset(),
          ),
        ],
      ),
    );
  }
}
