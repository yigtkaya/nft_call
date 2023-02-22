import 'package:cloud_firestore/cloud_firestore.dart';

class KTCardItem {
  String? collectionName;
  String? eventId;
  DateTime? mintDate;
  String? mintPrice;
  String? blockchain;
  String? description;
  String? website;
  String? discord;
  String? twitter;
  String? imageUrl;
  String? marketplace;
  List? tags;
  List? favUidList;

  KTCardItem({
    this.collectionName,
    this.eventId,
    this.mintDate,
    this.mintPrice,
    this.blockchain,
    this.website,
    this.discord,
    this.imageUrl,
    this.description,
    this.twitter,
    this.tags,
    this.marketplace,
    this.favUidList,
  });

  factory KTCardItem.fromMap(Map<dynamic, dynamic> data) {
    List<String>? favs = [];
    List<String>? tags = [];

    for (var i in data["favList"]) {
      favs.add(i);
    }
    for (var i in data["tags"]) {
      tags.add(i);
    }
    return KTCardItem(
        collectionName: data['collectionName'],
        eventId: data['eventId'],
        mintDate: data['mintDate'].toDate(),
        mintPrice: data['mintPrice'],
        blockchain: data['blockchain'],
        website: data['website'],
        discord: data['discord'],
        imageUrl: data['imageUrl'],
        description: data['description'],
        twitter: data['twitter'],
        marketplace: data['marketplace'],
        favUidList: data["favList"],
        tags: data["tags"]);
  }

  KTCardItem.fromDocumentSnapshot({required DocumentSnapshot snapshot}){
    eventId = snapshot.id;
    collectionName = snapshot["collectionName"];
    eventId =  snapshot['eventId'];
    mintDate =  snapshot['mintDate'];
    mintPrice =  snapshot['mintPrice'];
    blockchain = snapshot['blockchain'];
    website = snapshot['website'];
    discord = snapshot['discord'];
    imageUrl = snapshot['imageUrl'];
    description = snapshot['description'];
    twitter = snapshot['twitter'];
    marketplace = snapshot['marketplace'];
    favUidList = snapshot["favList"];
  }

  String get getSafecCollectionName => collectionName ?? "";
}
