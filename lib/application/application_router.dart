import 'package:flutter/material.dart';

import 'package:shiori/domain/domain.dart';
import 'package:shiori/application/models/models.dart';
import 'package:shiori/application/view_models/view_models.dart';
import 'package:shiori/application/screens/screens.dart';
import 'package:shiori/shared/shared.dart';

class ApplicationRouter {
  static const String home = '/';
  static const String brings = '/brings';
  static const String plans = '/plans';
  static const String planDetail = '/plans_detail';
  static const String prices = '/prices';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        final model = PlansModel(firestoreService: FirestoreService.instance);
        final viewModel = PlansViewModel(model: model);
        return MaterialPageRoute(
          builder: (_) => PlansScreen.wrapped(viewModel: viewModel),
        );
      case brings:
        return MaterialPageRoute(
          builder: (_) => BringsScreen(),
        );
      case plans:
        final model = PlansModel(firestoreService: FirestoreService.instance);
        final viewModel = PlansViewModel(model: model);
        return MaterialPageRoute(
          builder: (_) => PlansScreen.wrapped(viewModel: viewModel),
        );
      case planDetail:
        final args = settings.arguments as PlanDetailArgs;
        final model = PlanDetailModel(duration: Duration(seconds: 1), plan: args.plan, firestoreService: FirestoreService.instance);
        final viewModel = PlanDetailViewModel(model: model);
        return MaterialPageRoute(
          builder: (_) => PlanDetailScreen.wrapped(viewModel: viewModel),
        );
      case prices:
        return MaterialPageRoute(
          builder: (_) => PricesScreen(),
        );
      default:
        throw UnimplementedError('/${settings.name} is not configured');
    }
  }
}

class PlanDetailArgs {
  final Plan plan;

  PlanDetailArgs({
    required this.plan,
  });
}