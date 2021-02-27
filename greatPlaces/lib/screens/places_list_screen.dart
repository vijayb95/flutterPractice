import 'package:flutter/material.dart';
import 'package:greatPlaces/providers/great_places.dart';
import 'package:greatPlaces/screens/add_place_screen.dart';
import 'package:greatPlaces/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: const Text('Got no places yet!'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
                    ? ch
                    : Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView.builder(
                          itemBuilder: (ctx, i) => Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: FileImage(
                                    greatPlaces.items[i].image,
                                  ),
                                ),
                                title: Text(greatPlaces.items[i].title),
                                subtitle:
                                    Text(greatPlaces.items[i].location.address),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      PlaceDetailsScreen.routeName,
                                      arguments: greatPlaces.items[i].id);
                                },
                              ),
                              Divider(),
                            ],
                          ),
                          itemCount: greatPlaces.items.length,
                        ),
                      ),
              ),
      ),
    );
  }
}
