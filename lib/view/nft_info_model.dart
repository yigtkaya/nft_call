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

  @override
  KTCardItem fromJson(Map<String, dynamic> json) {
    collectionName = json['menuKey'];
    mintDate = json['parentMenuKey'];
    mintPrice = json['resourceKey'];
    blockchain = json['imageUrl'];
    website = json['order'];
    discord = json['badge'];
    description = json['description'];
    twitter = json['explanation'];
    marketplace = json['type'];
    isFavorite = json['isFavorite'];
    isAlertsOn = json['isAlertsOn'];
    return this;
  }

  @override
  KTCardItem.fromJson(Map<String, dynamic> json) {
    collectionName = json['menuKey'];
    mintDate = json['parentMenuKey'];
    mintPrice = json['resourceKey'];
    blockchain = json['imageUrl'];
    website = json['order'];
    discord = json['badge'];
    description = json['description'];
    twitter = json['explanation'];
    marketplace = json['type'];
    isFavorite = json['isFavorite'];
    isAlertsOn = json['isAlertsOn'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['menuKey'] = collectionName;
    data['parentMenuKey'] = mintDate;
    data['resourceKey'] = mintPrice;
    data['imageUrl'] = blockchain;
    data['order'] = website;
    data['badge'] = discord;
    data['description'] = description;
    data['explanation'] = twitter;
    data['type'] = marketplace;
    data['isFavorite'] = isFavorite;
    data['isAlertsOn'] = isAlertsOn;
    return data;
  }

  String get getSafeDescription => description ?? "";
  bool get getSafeIsFavorite => isFavorite ?? false;
  bool get getSafeIsAlertsOn => isFavorite ?? false;
}
