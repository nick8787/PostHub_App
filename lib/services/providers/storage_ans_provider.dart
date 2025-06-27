import 'package:flutter/material.dart';
import 'package:user_auth_crudd10/services/providers/storage_answer_item.dart';

class StorageAnsProvider extends ChangeNotifier {
  List<StorageAnswerItem> _ansItem = [];

  List<StorageAnswerItem> get ansItem => _ansItem;

  Future<void> fetchAnsItems(String path) async {
    // Example data fetching logic. Replace with your own API
    _ansItem = [
      StorageAnswerItem(name: 'Answer Folder', isFolder: true, path: 'ans/folder'),
      StorageAnswerItem(name: 'Answer PDF', isFolder: false, path: 'answer.pdf'),
    ];
    notifyListeners();
  }
}
