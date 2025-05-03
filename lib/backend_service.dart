import 'package:victor_projet/modeles/country.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';

class BackendService {
  static Future<List<Country>?> getCountries() async {
    List<Country> data = [];

    // Vérification de la connectivité
    var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile ||
    //  connectivityResult == ConnectivityResult.wifi) {
    try {
      final res = await http.get(
        Uri.parse(
          'https://countriesnow.space/api/v0.1/countries/info?returns=population,flag,iso2,iso3,phone_code,capital',
        ),
      );

      // Vérification du statut HTTP
      if (res.statusCode == 200) {
        var body = json.decode(res.body);
        for (var item in body["data"]) {
          data.add(
            Country(
              name: item['name'] ??
                  '', // Utilisation de l'opérateur '??' pour les valeurs nulles
              capital: item['capital'] ?? 'N/A',
              population: item['population'] ?? 0,
              area: item['area'] ?? 0,
              flagUrl: item['flag'] ?? '',
            ),
          );
        }
        return data; // Renvoie la liste des pays
      } else {
        // Retour explicite en cas d'erreur de requête
        throw Exception(
            'Échec de la récupération des données. Code: ${res.statusCode}');
      }
    } catch (error) {
      // Gestion des erreurs
      print('Erreur lors de la récupération des pays: $error');
      return null; // Retourne null en cas d'erreur
    }
    // } else {
    //   // Si pas de connexion
    //   print('Aucune connexion réseau disponible.');
    //   return null; // Retourne null si pas de connexion
    // }
  }
}