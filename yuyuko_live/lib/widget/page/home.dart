import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuyuko_live/provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _provider = HomeProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yuyuko Live'),
      ),
      body: ChangeNotifierProvider.value(
        value: _provider,
        child: Consumer<HomeProvider>(
          builder: (context, value, child) {
            if (value.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const Center(
              child: Text('Hello World'),
            );
          },
        ),
      ),
    );
  }
}
