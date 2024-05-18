import 'package:bee_shop/widgets/category.dart';
import 'package:bee_shop/widgets/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bee Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bee Shop Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/food.jpg'),
                      radius: 32,
                    ),
                    Column(
                      children: [Text('admin'), Text('admin@gmail.com')],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text('Home'),
              trailing: const Text('2'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              trailing: const Text('10'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryList()));
              },
            ),
            const ListTile(
              leading: Icon(Icons.money_off_csred_rounded),
              title: Text('Items'),
              trailing: Text('20'),
            ),
            const ListTile(
              leading: Icon(Icons.money_off_csred_rounded),
              title: Text('Orders'),
              trailing: Text(''),
            ),
            const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
                trailing: Text('')),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('About Me'),
              trailing: Text(''),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
