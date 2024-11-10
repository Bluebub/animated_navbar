import 'package:animated_dock/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BottomNavProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavWithReorderableList(),
    );
  }
}

class BottomNavWithReorderableList extends StatefulWidget {
  const BottomNavWithReorderableList({super.key});

  @override
  _BottomNavWithReorderableListState createState() =>
      _BottomNavWithReorderableListState();
}

class _BottomNavWithReorderableListState
    extends State<BottomNavWithReorderableList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Access the BottomNavProvider instance
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Reorderable Bottom Navigation')),
      body: const Center(
        child: Text('Reorder items in the Bottom Navigation Bar'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: kToolbarHeight,
          child: ReorderableListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(), // Disabled scrolling
            onReorder: (oldIndex, newIndex) {
              bottomNavProvider.reorderItems(
                  oldIndex, newIndex); // Using provider to reorder items
            },
            itemCount: bottomNavProvider.navItems.length,
            itemBuilder: (context, index) {
              final item = bottomNavProvider.navItems[index];
              return SizedBox(
                key: ValueKey(item.name),
                width: MediaQuery.of(context).size.width /
                    bottomNavProvider.navItems.length,
                child: Container(
                  color: Colors.black87,
                  child: ReorderableDragStartListener(
                    index: index,
                    child: Center(child: item.item),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
