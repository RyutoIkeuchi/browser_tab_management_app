import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subPropertyWidgetKeyProvider =
    StateNotifierProvider<SubPropertyWidgetKeyNotifier, GlobalKey>(
        (ref) => SubPropertyWidgetKeyNotifier());

class SubPropertyWidgetKeyNotifier extends StateNotifier<GlobalKey> {
  SubPropertyWidgetKeyNotifier() : super(GlobalKey());
}

final appBarGlobalKeyProvider =
    StateNotifierProvider<AppBarGlobalKeyNotifier, GlobalKey>(
        (ref) => AppBarGlobalKeyNotifier());

class AppBarGlobalKeyNotifier extends StateNotifier<GlobalKey> {
  AppBarGlobalKeyNotifier() : super(GlobalKey());
}

final navigationRailGlobalKeyProvider =
    StateNotifierProvider<NavigationRailGlobalKeyNotifier, GlobalKey>(
        (ref) => NavigationRailGlobalKeyNotifier());

class NavigationRailGlobalKeyNotifier extends StateNotifier<GlobalKey> {
  NavigationRailGlobalKeyNotifier() : super(GlobalKey());
}
