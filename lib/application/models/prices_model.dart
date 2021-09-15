import 'package:rxdart/rxdart.dart';

import 'package:shiori/domain/domain.dart';
import 'package:shiori/shared/shared.dart';

abstract class PricesModelable {
  /// ロード中かどうかが流れてくる `Stream<bool>`.
  Stream<bool> get isLoading;
  /// Firestore から取得してきた費用一覧 `Stream<List<Price>>`.
  Stream<List<Price>> get prices;
  /// 発生したエラーを流す `Stream<Error>`.
  Stream<Error> get error;
  /// 費用一覧を取得する.
  void fetch();
  /// リソースの解放.
  void dispose();
}

class PricesModel extends PricesModelable {

  // MARK: Dependency

  Plan _plan;
  FirestoreService _firestoreService;

  PricesModel({
    required FirestoreService firestoreService,
    required Plan plan,
  }): this._firestoreService = firestoreService,
      this._plan = plan;

  // MARK: Properties

  final BehaviorSubject<bool> _isLoadingSubject = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get isLoading => _isLoadingSubject.stream;
  final BehaviorSubject<List<Price>> _pricesSubject = BehaviorSubject<List<Price>>.seeded([]);
  Stream<List<Price>> get prices => _pricesSubject.stream;
  final PublishSubject<Error> _errorSubject = PublishSubject<Error>();
  Stream<Error> get error => _errorSubject.stream;

  // MARK: Public

  void fetch() async {
    _isLoadingSubject.add(true);
    try {
      final snapshot = await _firestoreService.getNestedDocuments(collection: Collection.Plans, path: _plan.id, subCollection: SubCollection.Prices);
      final decoded = snapshot.docs.map((e) => Price.fromData(id: e.id, data: e.data())).toList();
      _pricesSubject.add(decoded);
    } on Error catch(error) {
      _errorSubject.add(error);
    } catch(error) {
      print(error);
    }
    _isLoadingSubject.add(false);
  }

  @override
  void dispose() {
    _isLoadingSubject.close();
    _pricesSubject.close();
    _errorSubject.close();
  }
}