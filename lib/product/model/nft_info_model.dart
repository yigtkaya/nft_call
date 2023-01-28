import 'package:firebase_database/firebase_database.dart';

class KTCardItem {
  String? collectionName;
  String? mintDate;
  String? mintPrice;
  String? blockchain;
  String? description;
  String? website;
  String? discord;
  String? twitter;
  String? imageUrl;
  String? marketplace;
  List? isFavorite;
  List? isAlertsOn;

  KTCardItem({
    this.collectionName,
    this.mintDate,
    this.mintPrice,
    this.blockchain,
    this.website,
    this.discord,
    this.imageUrl,
    this.description,
    this.twitter,
    this.marketplace,
    this.isFavorite,
    this.isAlertsOn,
  });

  factory KTCardItem.fromRTDB(Map<String, dynamic> data) {
    return KTCardItem(
        collectionName: data['collectionName'],
        mintDate: data['mintDate'],
        mintPrice: data['mintPrice'],
        blockchain: data['blockchain'],
        website: data['website'],
        discord: data['discord'],
        imageUrl: data['imageUrl'],
        description: data['description'],
        twitter: data['twitter'],
        marketplace: data['marketplace'],
        isFavorite: data['isFavorite'],
        isAlertsOn: data['isAlertsOn']);
  }
  factory KTCardItem.fromList(Map<dynamic, dynamic> data) {
    List<String>? favs = [];
    List<String>? alerts = [];

      for (var i in data["isFavorite"]) {
        favs.add(i);
      }
    for (var i in data["isAlertsOn"]) {
      favs.add(i);
    }
    return KTCardItem(
        collectionName: data['collectionName'],
        mintDate: data['mintDate'],
        mintPrice: data['mintPrice'],
        blockchain: data['blockchain'],
        website: data['website'],
        discord: data['discord'],
        imageUrl: data['imageUrl'],
        description: data['description'],
        twitter: data['twitter'],
        marketplace: data['marketplace'],
        isFavorite: favs ?? [],
        isAlertsOn: alerts ?? []);
  }

  String get getSafeDescription => description ?? "";
  List get getSafeIsFavorite => isFavorite ?? [];
  List get getSafeIsAlertsOn => isFavorite ?? [];
}
