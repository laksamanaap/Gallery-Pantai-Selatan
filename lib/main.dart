import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pesona Pantai Selatan',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gallery Pantai Selatan'),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Text('pesonawisatamalang.com'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            GridView.count(
              // Items in row
              crossAxisCount: 3,
              // Vertical spacing between rows
              mainAxisSpacing: 5.0,
              // Horizontal spacing between columns
              crossAxisSpacing: 5.0,
              // Padding of GridView
              padding: const EdgeInsets.all(5.0),
              // The ratio between the width and height of items
              childAspectRatio: 0.75,
              // List of items widgets
              children: items
                  .map<Widget>((Item item) => _ItemGridCellWidget(item))
                  .toList(),
            ),
            // ListView tab content Widget
          ],
        ),
      ),
    );
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Item _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_item.name),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.imageUrl),
            tag: _item.name,
            child: Image.network(
              _item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Item _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      title: Text(
        _item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 40,
        ),
      ),

      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 150,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Item _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.name),
      ),
      body: SizedBox.expand(
        child: Hero(
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<Item> items = [
  Item(
    "https://thumbs.dreamstime.com/b/beautiful-balekambang-beach-malang-east-java-beautiful-balekambang-beach-malang-east-java-222293417.jpg",
    "Balekambang Beach",
  ),
  Item(
    "https://2.bp.blogspot.com/-3GpCyWCGcRY/XIeRH9Dr-FI/AAAAAAAAB50/Y4WIzyIagSMhhdirEr8TPoCzrgnvRS8igCLcBGAs/s1600/Lokasi%2BPantai%2BTeluk%2BAsmara%252C%2BSpot%2BSnorkeling%2Byang%2BMemikat%2BHati.jpg",
    "Teluk Asmara Beach",
  ),
  Item(
    "https://upload.wikimedia.org/wikipedia/commons/0/0a/Pantai_Watu_Leter%2C_Malang_Selatan%2C_Jawa_Timur.jpg",
    "Watu Leter Beach",
  ),
  Item(
    "https://3.bp.blogspot.com/-jPtr1sJrhe4/WsgYIzJfrsI/AAAAAAAAeE0/W5GfE6vf7gkNpRL9u9ujyabpO1OLjv3wgCLcBGAs/s1600/Indahnya%2BPantai%2BBatu%2BBengkung%2BMalang.png",
    "Batu Bengkung Beach",
  ),
  Item(
    "https://1.bp.blogspot.com/-ioGNU0bBwlQ/VVM1RAq2JBI/AAAAAAAAAHA/irsPcnr61Zs/s1600/clungup.jpg",
    "Clungup Beach",
  ),
  Item(
    "https://asset.kompas.com/crops/rdjRprhRUI8UrMJvfLqJRG9n0mk=/0x0:739x493/750x500/data/photo/2020/07/26/5f1d20f0b8e81.jpg",
    "Sendang Biru Beach",
  ),
  Item(
    "https://4.bp.blogspot.com/-MwC9mlr8uTw/WOWt1KDrPnI/AAAAAAAAGsg/tbO-G28aHj0hvyxbeYBMErGclNg60kyRgCLcB/s400/pantai%2B3%2Bwarna%2Bdari%2Batas.jpg",
    "Tiga Warna Beach",
  ),
  Item(
    "https://img.inews.co.id/media/822/files/inews_new/2020/02/17/Gua_cina1.jpg",
    "Gua Cina Beach",
  ),
  Item(
    "https://3.bp.blogspot.com/-rdTPJblP1ZU/Vbr_m4BrL2I/AAAAAAAAC5s/LpaJcEjlezg/s1600/SAM_9349.JPG",
    "Segara Anakan Beach",
  ),
  Item(
    "https://i0.wp.com/anomharya.com/wp-content/uploads/Pemancing-di-Ngantep1.jpg?resize=620%2C348",
    "Ngantep Beach",
  ),
  Item(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTak7jLXsSzP3XqKOWKaWrh2uxsi0gQja9JuQ&usqp=CAU",
    "Ungapan Beach",
  ),
  Item(
    "https://i0.wp.com/penginapan.net/wp-content/uploads/Pantai-Sendiki-Malang..jpg?fit=460%2C300&ssl=1",
    "Sendiki Beach",
  ),
];
