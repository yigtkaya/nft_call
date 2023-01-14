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
  String? marketplace;
  bool? isFavorite;
  bool? isAlertsOn;

  KTCardItem({
    this.collectionName,
    this.mintDate,
    this.mintPrice,
    this.blockchain,
    this.website,
    this.discord,
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
        description: data['description'],
        twitter: data['twitter'],
        marketplace: data['marketplace'],
        isFavorite: data['isFavorite'],
        isAlertsOn: data['isAlertsOn']);
  }
  factory KTCardItem.fromList(Map<dynamic, dynamic> data) {
    return KTCardItem(
        collectionName: data['collectionName'],
        mintDate: data['mintDate'],
        mintPrice: data['mintPrice'],
        blockchain: data['blockchain'],
        website: data['website'],
        discord: data['discord'],
        description: data['description'],
        twitter: data['twitter'],
        marketplace: data['marketplace'],
        isFavorite: data['isFavorite'],
        isAlertsOn: data['isAlertsOn']);
  }

  String get getSafeDescription => description ?? "";
  bool get getSafeIsFavorite => isFavorite ?? false;
  bool get getSafeIsAlertsOn => isFavorite ?? false;
}
