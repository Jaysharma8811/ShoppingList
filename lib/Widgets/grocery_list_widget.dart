import 'package:flutter/material.dart';
import 'package:shoppinglistapp/Widgets/new_item_widget.dart';
import 'package:shoppinglistapp/Widgets/show_list_widget.dart';

import '../models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  void _addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const NewItem()),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }
  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent=const Center(
      child: Text('No item found. Start adding some!'),
    );
    if(_groceryItems.isNotEmpty){
      mainContent=ShowList(groceryItems: _groceryItems,onRemove: _removeItem,);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: mainContent,
    );
  }
}
