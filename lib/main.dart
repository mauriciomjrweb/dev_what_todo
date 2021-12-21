import 'package:dev_what_todo/page/home_page.dart';
import 'package:dev_what_todo/provider/todos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final String title = 'Todo App';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: Color(0xFFf6f5ee),
        ),
        home: HomePage(),
      ),
    );
  }
}
