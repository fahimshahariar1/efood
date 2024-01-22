import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final bool fromAppBar;
  const HomeScreen(this.fromAppBar, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}




class _HomeScreenState extends State<HomeScreen> {



  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(child: Text('home')),

    );
  }


}

