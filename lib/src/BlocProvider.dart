import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wialon_app/Injection.dart';
import 'package:wialon_app/src/domain/useCase/item/ItemUseCases.dart';
import 'package:wialon_app/src/presentation/pages/item/bloc/ItemBloc.dart';
import 'package:wialon_app/src/presentation/pages/item/bloc/ItemEvent.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<ItemBloc>(
    lazy: false,
    create: (context) =>
        ItemBloc(locator<ItemUseCases>())..add(ItemInitEvent()),
  ),
];
