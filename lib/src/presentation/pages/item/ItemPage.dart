import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wialon_app/src/domain/models/Item.dart';
import 'package:wialon_app/src/domain/utils/Resource.dart';
import 'package:wialon_app/src/presentation/pages/item/ItemContent.dart';
import 'package:wialon_app/src/presentation/pages/item/bloc/ItemBloc.dart';
import 'package:wialon_app/src/presentation/pages/item/bloc/ItemState.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    Item item = Item();
    return Scaffold(
      body: BlocListener<ItemBloc, ItemState>(
        listener: (context, state) {
          final response = state.response;

          if (response is Error) {
            Fluttertoast.showToast(
              msg: response.message,
              toastLength: Toast.LENGTH_LONG,
            );
          }
        },
        child: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            final response = state.response;

            final isLoading = isLoadingState(state);
            if (isLoading) {
              item = Item();
            }
            if (response is Success) {
              item = response.data as Item;
            }

            return Stack(
              children: [
                ItemContent(item, isLoading: isLoading),
                if (isLoading)
                  SafeArea(
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  bool isLoadingState(ItemState state) {
    return state.response is Loading;
  }
}
