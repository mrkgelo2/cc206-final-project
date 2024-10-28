import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double oneRem = 16;
  List<String> items = List.generate(6, (index) => "Item $index");

  void _showPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Popup"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          _showPopup(context, "FloatingActionButton pressed");
        },
        child: const Icon(Icons.check),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text("Welcome to Flutter!"),
              const SizedBox(width: 100),
              TextButton(onPressed: () {}, child: const Text("Home")),
              TextButton(onPressed: () {}, child: const Text("About")),
              TextButton(onPressed: () {}, child: const Text("Contact")),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  height: double.maxFinite,
                  width: 175,
                  padding: EdgeInsets.all(oneRem),
                  color: Colors.lightBlue,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Dismissible(
                        key: Key(item),
                        direction: DismissDirection.horizontal,
                        background: Container(
                          color: Colors.red,
                          child: const Icon(Icons.delete),
                        ),
                        child: ListTile(
                          title: Text(item),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    padding: EdgeInsets.all(oneRem),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onDoubleTap: () {
                            _showPopup(
                                context, "GestureDetector double-clicked");
                          },
                          child: Container(
                            color: Colors.amber,
                            padding: EdgeInsets.all(oneRem),
                            child: const Text("Double-click me"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        IconButton(
                          icon: const Icon(Icons.thumb_up),
                          onPressed: () {
                            _showPopup(context, "IconButton pressed");
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _showPopup(context, "ElevatedButton pressed");
                          },
                          child: const Text("Press me"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
