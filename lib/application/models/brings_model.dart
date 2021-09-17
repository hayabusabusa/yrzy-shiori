import 'package:rxdart/rxdart.dart';

import 'package:shiori/domain/domain.dart';
import 'package:shiori/shared/shared.dart';

abstract class BringsModelable {
  /// ロード中かどうかが流れてくる `Stream<bool>`.
  Stream<bool> get isLoading;
  /// Firestore から取得してきた荷物一覧 `Stream<List<Bring>>`.
  Stream<List<Bring>> get brings;
  /// 発生したエラーを流す `Stream<Error>`.
  Stream<Error> get error;
  /// 荷物一覧を取得する.
  void fetch();
  /// リソースの解放.
  void dispose();
}

class BringsModel extends BringsModelable {

  // MARK: Dependency

  Plan _plan;
  FirestoreService _firestoreService;

  BringsModel({
    required Plan plan,
    required FirestoreService firestoreService,
  }): this._plan = plan, 
      this._firestoreService = firestoreService;
    
  // MARK: Properties

  final BehaviorSubject<bool> _isLoadingSubject = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get isLoading => _isLoadingSubject.stream;
  final BehaviorSubject<List<Bring>> _bringsSubject = BehaviorSubject<List<Bring>>.seeded([]);
  Stream<List<Bring>> get brings => _bringsSubject.stream;
  final PublishSubject<Error> _errorSubject = PublishSubject<Error>();
  Stream<Error> get error => _errorSubject.stream;

  void fetch() async {
    _isLoadingSubject.add(true);
    try {
      final snapshot = await _firestoreService.getNestedDocuments(collection: Collection.Plans, path: _plan.id, subCollection: SubCollection.Brings);
      final decoded = snapshot.docs.map((e) => Bring.fromData(id: e.id, data: e.data())).toList();
      _bringsSubject.add(decoded);
    } on Error catch(error) {
      _errorSubject.add(error);
    } catch(error) {
      print(error);
    }
    _isLoadingSubject.add(false);
  }

  void dispose() {
    _isLoadingSubject.close();
    _bringsSubject.close();
    _errorSubject.close();
  }
}