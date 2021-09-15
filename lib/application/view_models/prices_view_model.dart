import 'package:flutter/foundation.dart';

import 'package:shiori/application/models/models.dart';
import 'package:shiori/shared/shared.dart';

class PricesViewModel extends ChangeNotifier {

  // MARK: Dependency

  late PricesModelable _model;

  PricesViewModel({
    required PricesModelable model,
  }) {
    _model = model;
    _model.isLoading.listen((event) { 
      _isLoading = event;
      notifyListeners();
    });
    _model.prices.listen((event) {
      _prices = event;
      notifyListeners();
    });

    _model.fetch();
  }

  // MARK: Properties

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Price> _prices = [];
  List<Price> get prices => _prices;

  // MARK: Public

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
}