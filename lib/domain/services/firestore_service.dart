import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  static FirestoreService? _instance;
  static FirestoreService get instance {
    final instance = _instance;
    if (instance != null) {
      return instance;
    }
    final newInstance = FirestoreService._();
    _instance = newInstance;
    return newInstance;
  }

  FirestoreService._();
  
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// 単一のドキュメントを取得する.
  /// 
  /// `/yrzy.shiori/v1/{Collection}/{path}` にドキュメントを取得しにいく.
  Future<DocumentSnapshot<Map<String, dynamic>>> getDocument({
    required Collection collection,
    required String path,
  }) async {
    return _db.collection(_Root.Default.rawValue)
      .doc(_Version.V1.rawValue)
      .collection(collection.rawValue)
      .doc(path)
      .get();
  }

  /// ドキュメント一覧を取得する.
  /// 
  /// `/yrzy.shiori/v1/{Collection}/{path}` にドキュメントを取得しにいく.
  Future<QuerySnapshot<Map<String, dynamic>>> getDocuments({
    required Collection collection,
  }) async {
    return _db.collection(_Root.Default.rawValue)
      .doc(_Version.V1.rawValue)
      .collection(collection.rawValue)
      .get();
  }

  /// 単一のドキュメントを取得する.
  /// 
  /// `/yrzy.shiori/v1/{Collection}/{path}/{SubCollection}` にドキュメントを取得しにいく.
  Future<DocumentSnapshot<Map<String, dynamic>>> getNestedDocument({
    required Collection collection,
    required String path,
    required SubCollection subCollection,
    required String subPath,
  }) async {
    return _db.collection(_Root.Default.rawValue)
        .doc(_Version.V1.rawValue)
        .collection(collection.rawValue)
        .doc(path)
        .collection(subCollection.rawValue)
        .doc(subPath)
        .get();
  }

  /// ドキュメント一覧を取得する.
  /// 
  /// `/yrzy.shiori/v1/{Collection}/{path}/{SubCollection}` にドキュメントを取得しにいく.
  Future<QuerySnapshot<Map<String, dynamic>>> getNestedDocuments({
    required Collection collection,
    required String path,
    required SubCollection subCollection,
  }) async {
    return _db.collection(_Root.Default.rawValue)
      .doc(_Version.V1.rawValue)
      .collection(collection.rawValue)
      .doc(path)
      .collection(subCollection.rawValue)
      .get();
  }

  /// 単一のドキュメントを追加する.
  /// 
  /// `/yrzy.shiori/v1/{Collection}/{RANDOM}` にドキュメントを追加する.
  Future<void> setDocument({
    required Collection collection,
    required Map<String, dynamic> data,
  }) async {
    return _db.collection(_Root.Default.rawValue)
      .doc(_Version.V1.rawValue)
      .collection(collection.rawValue)
      .doc()
      .set(data);
  }

  /// 単一のドキュメントを追加する.
  /// 
  /// `/yrzy.shiori/v1/{Collection}/{path}/{SubCollection}/{RANDOM}` にドキュメントを追加する.
  Future<void> setNestedDocument({
    required Collection collection,
    required String path,
    required SubCollection subCollection,
    required Map<String, dynamic> data,
  }) async {
    return _db.collection(collection.rawValue)
        .doc(path)
        .collection(subCollection.rawValue)
        .doc()
        .set(data);
  }
}

enum _Root {
  Default
}

extension _RootExtension on _Root {
  String get rawValue {
    switch (this) {
      case _Root.Default :
        return 'yrzy.shiori';
    }
  }
}

enum _Version {
  V1
}

extension _VersionExtension on _Version {
  String get rawValue {
    switch (this) {
      case _Version.V1 :
        return 'v1';
    }
  }
}

enum Collection {
  /// ルート計画一覧.
  Plans,
  /// ランドマーク一覧.
  Landmarks,
}

extension _CollectionExtension on Collection {
    String get rawValue {
    switch (this) {
      case Collection.Plans :
        return 'plans';
      case Collection.Landmarks:
        return 'landmarks';
    }
  }
}

enum SubCollection {
  /// ルート計画内の地点一覧.
  Points
}

extension _SubCollectionExtension on SubCollection {
  String get rawValue {
    switch (this) {
      case SubCollection.Points :
        return 'points';
    }
  }
}