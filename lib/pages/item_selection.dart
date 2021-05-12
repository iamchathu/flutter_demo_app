import 'package:demo_app/data/item.dart';
import 'package:flutter/material.dart';

class ItemSelectionArguments {
  final Function(Item) onAddItem;

  ItemSelectionArguments({this.onAddItem});
}

class ItemSelection extends StatelessWidget {
  static String routeName = '/item-selection';

  final List<Item> items = [
    Item(
      code: 1,
      itemName: "Coca cola",
      price: 200,
    ),
    Item(
      code: 2,
      itemName: "EGB",
      price: 150,
    ),
    Item(
      code: 3,
      itemName: "Mango",
      price: 190,
    ),
    Item(
      code: 4,
      itemName: "Smack",
      price: 120,
    ),
  ];

  ItemSelection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemSelectionArguments arguments =
        ModalRoute.of(context).settings.arguments as ItemSelectionArguments;

    final onAddItem = arguments.onAddItem;

    return Scaffold(
      appBar: AppBar(
        title: Text("Item Selection"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) => ElevatedButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  items[index].itemName,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                ),
                Text(
                  items[index].price.toString(),
                )
              ],
            ),
            onPressed: () {
              onAddItem(items[index]);
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
