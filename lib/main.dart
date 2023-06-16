import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quizzapp/cubit/quiz_cubit.dart';
import 'package:quizzapp/widgets/quiz_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: kIsWeb,
    isToolbarVisible: false,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => QuizCubit(),
        child: const QuizScreen(),
      ),
    );
  }
}
