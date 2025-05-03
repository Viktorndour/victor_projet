import 'package:flutter/material.dart';
import 'package:victor_projet/modeles/country.dart';
import 'package:victor_projet/screen/country-detail_screen.dart';
import 'package:victor_projet/widgets/alerteMessage.dart';
import 'package:victor_projet/backend_service.dart';
import 'package:victor_projet/widgets/bottomNav.dart/bottomNav.dart';
import 'package:victor_projet/widgets/menuDrawer.dart/menuDrawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({Key? key}) : super(key: key);

  @override
  CountriesScreenState createState() => CountriesScreenState();
}

class CountriesScreenState extends State<CountriesScreen> {
  List<Country> countries = [];

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  Future<void> getCountries() async {
    try {
      var value = await BackendService.getCountries();
      setState(() {
        if (value != null) {
          countries = value;
        }
      });
    } catch (e) {
      Navigator.pop(context);
      showMessageDialogue(
        context,
        'Erreur',
        'Une erreur est survenue lors de la récupération des données.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNav(indexSelection: 2),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        title: const Text(
          "Les pays du monde",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: countries.isNotEmpty ? _ShowCountries(countries) : _ShowProgresss(),
    );
  }

  Widget _ShowProgresss() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            backgroundColor: Colors.indigoAccent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Text(
              "Chargement...",
              style: TextStyle(fontSize: 12, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ShowCountries(List<Country> countries) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            title: Text(
              '${countries[index].name}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Capitale: ${countries[index].capital}'),
                Text('Population: ${countries[index].population}'),
              ],
            ),
            leading: ClipOval(
              child: Container(
                width: 50,
                height: 50,
                child: SvgPicture.network(
                  countries[index].flagUrl,
                  fit: BoxFit.cover,
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      CountryDetailScreen(country: countries[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
