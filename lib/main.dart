import 'package:flutter/material.dart';

import 'Connection.dart';
import 'Meals.dart';
import 'SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Connection connection = Connection();

  /// this method fire before build method using to call method that have to await
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies

    // laoding data using my getapidata() method and navigate to Second Screen when done
    List<Meals> list = await connection.getapidata() as List<Meals>;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SecondScreen(list: list)));
    super.didChangeDependencies();
  }
  /////// -----

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: FlutterLogo(),
                height: 300,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                child: CircularProgressIndicator(),
                width: 50,
                height: 50,
              )
            ],
          ),
        ),
      )),
    );
  }
}
