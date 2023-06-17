import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:stateman/tasklist.dart';

import 'addtasksheet.dart';
import 'model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: lightDynamic,
            scaffoldBackgroundColor: lightDynamic?.background,
            brightness: Brightness.light,
            primaryColor: lightDynamic?.onPrimaryContainer,
            cardColor: lightDynamic?.tertiaryContainer,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
              colorScheme: darkDynamic,
              scaffoldBackgroundColor: darkDynamic?.background,
              primaryColor: darkDynamic?.onPrimaryContainer,
              // primaryColorDark: darkDynamic?.primary,
              brightness: Brightness.dark,
              splashColor: darkDynamic?.tertiaryContainer,
              cardColor: darkDynamic?.secondaryContainer,
              useMaterial3: true),
          home: homescreen());
    });
  }
}

class homescreen extends StatelessWidget {
  homescreen({super.key});

  List<Task> tasks = [
    Task(name: "Buy breads"),
    Task(name: "Buy food"),
    Task(name: "Buy clothes"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.large(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context, builder: (context) => addtasksheet(tasks));
          },
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 20),
                  child: CircleAvatar(
                    child: Icon(Icons.menu),
                    radius: 20,
                  ),
                ),
              ),
              text(
                text1: 'Taskist',
                size: 40,
                ft: FontWeight.bold,
              ),
              text(
                text1: 'Add your daily task',
                size: 20,
                ft: FontWeight.normal,
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: tasklist(tasks),
                      )
                      // Container(height: 200, decoration: BoxDecoration(),),
                      ))
            ]));
  }
}

class text extends StatelessWidget {
  text({required this.text1, required this.size, required this.ft});
  String text1;
  int size;
  FontWeight ft;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: Text(
        text1,
        style: TextStyle(fontSize: size.toDouble(), fontWeight: ft),
      ),
    );
  }
}
