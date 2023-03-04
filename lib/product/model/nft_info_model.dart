
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
  int? favCount;
  List? tags;
  List? favUidList;

  KTCardItem({
    this.collectionName,
    this.eventId,
    this.mintDate,
    this.mintPrice,
    this.blockchain,
    this.website,
    this.favCount,
    this.discord,
    this.imageUrl,
    this.description,
    this.twitter,
    this.tags,
    this.marketplace,
    this.favUidList,
  });

  factory KTCardItem.fromMap(Map<dynamic, dynamic> data) {

    if (data["mintPrice"].toString().trim() == "-"){
      data["mintPrice"] = "Free";
    }
    return KTCardItem(
        collectionName: data['collectionName'],
        eventId: data['eventId'],
        favCount: data['favCount'],
        mintDate: data['mintDate'].toDate(),
        mintPrice: data['mintPrice'].toString().trim(),
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


  String get getSafeCollectionName => collectionName ?? "";
}
