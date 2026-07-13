import 'package:flutter/material.dart';
import 'package:wialon_app/config/routes/AppRoutes.dart';
import 'package:wialon_app/src/presentation/pages/item/ItemPage.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.item:
        return MaterialPageRoute(builder: (_) => const ItemPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("Pagina ${settings.name} no encontrada")),
          ),
        );
    }
  }
}
