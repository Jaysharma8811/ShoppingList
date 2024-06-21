import 'package:flutter/material.dart';

import '../models/grocery_item.dart';

class ShowList extends StatelessWidget{
  const ShowList({super.key,required this.groceryItems, required this.onRemove});

final List<GroceryItem> groceryItems;
  final void Function(GroceryItem item) onRemove;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryItems.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction){
          onRemove(groceryItems[index]);
        },
        key: ValueKey(groceryItems[index].id),
        child: ListTile(
          title: Text(groceryItems[index].name),
          leading: Container(
            width: 24,
            height: 24,
            color: groceryItems[index].category.color,
          ),
          trailing: Text(
            groceryItems[index].quantity.toString(),
          ),
        ),
      ),
    );

  }

}