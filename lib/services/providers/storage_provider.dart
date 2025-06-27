import 'package:flutter/material.dart';
import 'storage_item.dart';

class StorageProvider with ChangeNotifier {
  List<StorageItem> _items = [];
  List<StorageItem> get items => _items;

  Future<void> fetchItems(String path) async {
    // Example data fetching logic. Replace with your own API
    _items = [
      StorageItem(name: 'Sample Folder', isFolder: true, path: 'sample/folder'),
      StorageItem(name: 'Sample PDF', isFolder: false, path: 'sample.pdf'),
    ];
    notifyListeners();
  }
}
