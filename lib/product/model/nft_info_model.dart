class KTCardItem {
  String? collectionName;
  int? eventId;
  String? mintDate;
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

  factory KTCardItem.fromList(Map<dynamic, dynamic> data) {
    List<String>? favs = [];
    List<String>? tags = [];

    for (var i in data["favUidList"]) {
      favs.add(i);
    }
    for (var i in data["tags"]) {
      tags.add(i);
    }
    return KTCardItem(
        collectionName: data['collectionName'],
        eventId: data['eventId'],
        mintDate: data['mintDate'],
        mintPrice: data['mintPrice'],
        blockchain: data['blockchain'],
        website: data['website'],
        discord: data['discord'],
        imageUrl: data['imageUrl'],
        description: data['description'],
        twitter: data['twitter'],
        marketplace: data['marketplace'],
        favUidList: favs,
        tags: tags);
  }
}
