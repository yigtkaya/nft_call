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
    required this.collectionName,
    required this.mintDate,
    required this.mintPrice,
    required this.blockchain,
    required this.website,
    required this.discord,
    this.description,
    required this.twitter,
    required this.marketplace,
    required this.isFavorite,
    required this.isAlertsOn,
  });

  factory KTCardItem.fromRTDB(Map<String, dynamic> data) {
   return KTCardItem(collectionName: data['collectionName'],
       mintDate: data['mintDate'],
       mintPrice: data['mintDate'],
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
