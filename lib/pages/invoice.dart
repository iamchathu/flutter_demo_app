import 'package:demo_app/data/item.dart';
import 'package:demo_app/pages/item_selection.dart';
import 'package:flutter/material.dart';

class Invoice extends StatefulWidget {
  static String routeName = '/';

  Invoice({Key key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  final List<Item> items = [];

  get total => items.fold(
      0.0, (previousValue, element) => previousValue + element.price);

  void addItemToInvoice(Item item) {
    setState(() {
      // TODO: Check item already exists
      items.add(item);
    });
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Dismissible(
            direction: DismissDirection.endToStart,
            key: ObjectKey(items[index]),
            onDismissed: (direction) {
              deleteItem(index);
            },
            child: Card(
              child: ListTile(
                title: Text(
                  items[index].itemName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purpleAccent.shade100,
                  ),
                ),
                subtitle: Text(
                  items[index].price.toString(),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Text(
          total.toString(),
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Navigator.of(context).pushNamed(ItemSelection.routeName,
                arguments: ItemSelectionArguments(
                  onAddItem: addItemToInvoice,
                )),
      ),
    );
  }
}
