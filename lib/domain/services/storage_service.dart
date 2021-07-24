import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {

  static StorageService? _instance;
  static StorageService get instance {
    final instance = _instance;
    if (instance != null) {
      return instance;
    }
    final newInstance = StorageService._();
    _instance = newInstance;
    return newInstance;
  }

  StorageService._();

  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage({required File file}) async {
    final reference = _storage.ref('yrzy.shiori').child('images').child('${DateTime.now().millisecondsSinceEpoch}.jpg');
    final metadata = SettableMetadata(contentType: 'image/jpeg');
    await reference.putFile(file, metadata);
    return reference.getDownloadURL();
  }
}