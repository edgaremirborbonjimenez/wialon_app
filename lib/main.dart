import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wialon_app/Injection.dart';
import 'package:wialon_app/config/routes/AppRouter.dart';
import 'package:wialon_app/config/routes/AppRoutes.dart';
import 'package:wialon_app/config/theme/AppColors.dart';
import 'package:wialon_app/src/BlocProvider.dart';

void main() async{
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: (context, child) {
          return FToastBuilder()(context, child);
        },
        title: 'Wialson',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
            brightness: Brightness.light,
          ),
        ),
        initialRoute: AppRoutes.item,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
