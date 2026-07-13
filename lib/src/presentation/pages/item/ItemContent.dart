import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wialon_app/src/domain/models/Item.dart';
import 'package:wialon_app/src/presentation/pages/item/bloc/ItemBloc.dart';
import 'package:wialon_app/src/presentation/pages/item/bloc/ItemEvent.dart';
import 'package:wialon_app/src/presentation/widgets/DefaultButton.dart';

class ItemContent extends StatelessWidget {
  final Item item;
  final bool isLoading;
  const ItemContent(this.item, {this.isLoading = false, super.key});

  @override
  Widget build(BuildContext context) {
    final name = item.generalProperty.name;
    final km = item.counter.mileageCounter;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Unidad : $name",
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$km km',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            DefaultButton(
              text: 'Consultar kilometraje',
              onPressed: isLoading
                  ? null
                  : () => context.read<ItemBloc>().add(SearchItem()),
            ),
          ],
        ),
      ),
    );
  }
}
