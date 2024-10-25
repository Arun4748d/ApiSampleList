import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/controller/homescreenController.dart';
import 'package:sample/view/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Homescreencontroller(),)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home: Homescreen(),
        
      ),
    );
  }
}
