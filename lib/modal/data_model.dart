class DataModel {
  double? accountValue;
  String? lastPurchase;
  double? cashBalance;
  double? metalHoldings;
  List<BadgesData>? badgesData;

  DataModel(
      {this.accountValue,
        this.lastPurchase,
        this.cashBalance,
        this.metalHoldings,
        this.badgesData});

  DataModel.fromJson(Map<String, dynamic> json) {
    accountValue = json['account_value'];
    lastPurchase = json['last_purchase'];
    cashBalance = json['cash_balance'];
    metalHoldings = json['metal_holdings'];
    if (json['badges_data'] != null) {
      badgesData = <BadgesData>[];
      json['badges_data'].forEach((v) {
        badgesData!.add(BadgesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_value'] = accountValue;
    data['last_purchase'] = lastPurchase;
    data['cash_balance'] = cashBalance;
    data['metal_holdings'] = metalHoldings;
    if (badgesData != null) {
      data['badges_data'] = badgesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BadgesData {
  String? badgeTitle;
  String? badgeHertz;
  num? badgeBalance;
  String? badgeStatus;
  num? metalPrice;
  String? change;
  String? iconColor;
  String? titleColor;

  BadgesData(
      {this.badgeTitle,
        this.badgeHertz,
        this.badgeBalance,
        this.badgeStatus,
        this.metalPrice,
        this.change,
        this.iconColor,
        this.titleColor});

  BadgesData.fromJson(Map<String, dynamic> json) {
    badgeTitle = json['badge_title'];
    badgeHertz = json['badge_hertz'];
    badgeBalance = json['badge_balance'];
    badgeStatus = json['badge_status'];
    metalPrice = json['metal_price'];
    change = json['change'];
    iconColor = json['icon_color'];
    titleColor = json['title_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['badge_title'] = badgeTitle;
    data['badge_hertz'] = badgeHertz;
    data['badge_balance'] = badgeBalance;
    data['badge_status'] = badgeStatus;
    data['metal_price'] = metalPrice;
    data['change'] = change;
    data['icon_color'] = iconColor;
    data['title_color'] = titleColor;
    return data;
  }
}
