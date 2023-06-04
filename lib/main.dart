// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/services/app_router.dart';
import 'package:todo_app/views/screens/tasks_screen.dart';
import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(MyApp(router: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.router});
  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const TasksScreen(),
        onGenerateRoute: router.onGenerateRoute,
      ),
    );
  }
}
