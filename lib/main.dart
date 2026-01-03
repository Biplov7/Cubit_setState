import 'package:bloc_code/Theme/theme.dart';
import 'package:bloc_code/cubit/batman_cubit.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return BatmanCubit();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: HomeApp(),
      ),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  @override
  Widget build(BuildContext context) {
  final batmanCubit = BlocProvider.of<BatmanCubit>(context);
    return Scaffold(
      body: BlocBuilder<BatmanCubit, int>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              for (int i = 0; i < state; i++)
                Positioned(
                  top: Random().nextInt(400).toDouble(),
                  left: Random().nextInt(250).toDouble(),
                  child: Image.asset('assets/batman.png'),
                ),
            ],
          );
        },
      ),
      appBar: AppBar(title: Text("Batman Cubit"), centerTitle: true),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              batmanCubit.incrementBatman();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              batmanCubit.decrementBatman();
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              batmanCubit.zeroBatman();
            },
            child: Icon(Icons.exposure_zero),
          ),
        ],
      ),
    );
  }
}
