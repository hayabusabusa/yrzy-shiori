/// Firestore のデータをデコード、エンコードする処理を統一するための抽象クラス.
abstract class FirestoreCodable<T> {
  /// Firestore から読み込んだデータを任意の型に変換するメソッド.
  T decode(Map<String, dynamic> data, String documentID);
  /// Firestore に保存するための形式の `data` を返す.
  Map<String, dynamic> get data;
}