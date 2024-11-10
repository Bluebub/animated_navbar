import 'package:animated_dock/bottom_items.dart';
import 'package:animated_dock/model.dart';
import 'package:flutter/material.dart';

class BottomNavProvider with ChangeNotifier {
  // List of bottom navigation items
  final List<Model> _navItems = [
    Model(item: const Home(), name: "Home"),
    Model(item: const Profile(), name: "Profile"),
    Model(item: const Settings(), name: "Settings"),
    Model(item: const Search(), name: "Search"),
    Model(item: const Wallet(), name: "Wallet"),
  ];

  List<Model> get navItems => _navItems; // Expose items

  /// Method to reorder items
  /// this method is used to reorder items when its moved.
  /// removing item in the old index and inserting in new position.

  void reorderItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex -= 1;
    final item = _navItems.removeAt(oldIndex);
    _navItems.insert(newIndex, item);
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}
