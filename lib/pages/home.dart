import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var faker = new Faker();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage:
                NetworkImage("https://picsum.photos/${500 + index}/300"),
          ),
          title: Text("${faker.person.name()}"),
          subtitle:
              Text("${DateFormat.yMMMMd().add_jms().format(DateTime.now())}"),
        ),
      ),
      Center(
        child: Text("Menu ke 2"),
      ),
      Center(
        child: Text("Menu ke 3"),
      ),
      Center(
        child: Text("Menu ke 4"),
      ),
      Center(
        child: Text("Menu ke 5"),
      ),
    ];
    print(faker.person.name());
    return Scaffold(
        appBar: AppBar(
          title: Text("Package Faker"),
        ),
        body: widgets[currentIndex],
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          initialActiveIndex: 0,
          onTap: (int i) {
            setState(() {
              currentIndex = i;
            });
          },
        ));
  }
}
