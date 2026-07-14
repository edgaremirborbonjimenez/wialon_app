import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wialon_app/config/theme/AppColors.dart';
import 'package:wialon_app/src/domain/models/Item.dart';
import 'package:wialon_app/src/domain/utils/MileageTrendEnum.dart';
import 'package:wialon_app/src/presentation/pages/item/bloc/ItemBloc.dart';
import 'package:wialon_app/src/presentation/pages/item/bloc/ItemEvent.dart';
import 'package:wialon_app/src/presentation/widgets/DefaultButton.dart';
import 'package:wialon_app/src/presentation/widgets/Header.dart';

class ItemContent extends StatelessWidget {
  final String title;
  final Item item;
  final bool isLoading;
  const ItemContent(this.item, {this.isLoading = false, super.key})
    : title = 'Control de Kilometraje';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Header(title: title),
                    const SizedBox(height: 20),
                    _buildInfoCard(context, item),
                    const Spacer(),
                    _buildMileageCounter(context, item),
                    const SizedBox(height: 24),
                    _mileageChange(context, item),
                    const Spacer(),
                    DefaultButton(
                      text: isLoading
                          ? 'ACTUALIZANDO...'
                          : 'CONSULTAR KILOMETRAJE',
                      onPressed: isLoading
                          ? null
                          : () => context.read<ItemBloc>().add(SearchItem()),
                      icon: Icons.speed,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mileageChange(BuildContext context, Item item) {
    final (icon, text, subtext, temeColor) = _getTrendInfo(item);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Icon(icon, color: temeColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: temeColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(subtext, style: TextStyle(color: temeColor, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  (IconData, String, String, Color) _getTrendInfo(Item item) {
    return switch (item.mileageTrend?.trend) {
      MileageTrendEnum.unkown => (
        Icons.more_horiz,
        "Primera carga del kilometraje",
        "No hay kilometraje a comparar",
        AppColors.textPrimary,
      ),
      MileageTrendEnum.same => (
        Icons.remove,
        "El kilometraje no ha cambiado",
        "Sin variación registrada",
        AppColors.textPrimary,
      ),
      MileageTrendEnum.up => (
        Icons.trending_up,
        "El kilometraje ha aumentado",
        "+${item.mileageTrend?.difference} km desde la última consulta",
        AppColors.success,
      ),
      _ => (
        Icons.help_outline,
        "Sin información de tendencia",
        "No se pudo determinar la tendencia del kilometraje",
        AppColors.textPrimary,
      ),
    };
  }

  Widget _buildMileageCounter(BuildContext context, Item item) {
    final km = item.counter.mileageCounter;
    return Column(
      children: [
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.speed, color: AppColors.primary, size: 22),
                Text(
                  isLoading ? '---' : _formatKm(km),
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 28,
                  ),
                ),
                Text(
                  'km',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'DISTANCIA RECORRIDA TOTAL',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 11,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  String _formatKm(int km) {
    return km.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
  }

  Widget _buildInfoCard(BuildContext context, Item item) {
    final name = item.generalProperty.name;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UNIDAD',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 11,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          name,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
