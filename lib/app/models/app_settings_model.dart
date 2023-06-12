class AppSettingModel {
  String? sId;
  String? type;
  String? name;
  bool? status;
  String? appVersion;
  String? adrDownloadLink;
  String? iosDownloadLink;
  String? liveVersion;
  String? challengeEndTime;
  String? challengeMessage;
  String? primaryCurrency;
  String? primaryCurrencySymbol;
  String? primaryCurrencyRate;
  String? defaultCurrency;
  String? defaultCurrencySymbol;
  String? defaultCurrencyRate;
  int? raffleDrawAmount;
  String? luckyDrawCountDown;
  String? raffleDrawCountDown;
  String? raffleDrawCurrency;
  String? raffleDrawCurrencySymbol;
  int? weeklyDrawTickets;
  int? luckyDrawTickets;
  int? priceRange;
  String? firstPrizeDefault;
  String? secondPrizeDefault;
  String? thirdPrizeDefault;
  String? prizeRangeOneLabel;
  String? prizeRangeOneDefault;
  String? prizeRangeTwoLabel;
  String? prizeRangeTwoDefault;
  String? firstPrizePrimary;
  String? prizeRangeOnePrimary;
  String? prizeRangeTwoPrimary;
  String? secondPrizePrimary;
  String? thirdPrizePrimary;
  String? date;
  String? lbs_message;
  String? rds_message;

  AppSettingModel(
      {this.sId,
        this.type,
        this.name,
        this.status,
        this.appVersion,
        this.adrDownloadLink,
        this.iosDownloadLink,
        this.liveVersion,
        this.challengeEndTime,
        this.challengeMessage,
        this.primaryCurrency,
        this.primaryCurrencySymbol,
        this.primaryCurrencyRate,
        this.defaultCurrency,
        this.defaultCurrencySymbol,
        this.defaultCurrencyRate,
        this.raffleDrawAmount,
        this.raffleDrawCurrency,
        this.raffleDrawCurrencySymbol,
        this.weeklyDrawTickets,
        this.luckyDrawTickets,
        this.firstPrizeDefault,
        this.secondPrizeDefault,
        this.luckyDrawCountDown,
        this.raffleDrawCountDown,
        this.priceRange,
        this.thirdPrizeDefault,
        this.prizeRangeOneLabel,
        this.prizeRangeOneDefault,
        this.prizeRangeTwoLabel,
        this.prizeRangeTwoDefault,
        this.firstPrizePrimary,
        this.prizeRangeOnePrimary,
        this.prizeRangeTwoPrimary,
        this.secondPrizePrimary,
        this.thirdPrizePrimary,
        this.date});

  AppSettingModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    name = json['name'];
    status = json['status'];
    appVersion = json['app_version'];
    priceRange = json['prize_range'];
    luckyDrawCountDown = json['lucky_draw_count_down'];
    raffleDrawCountDown = json['raffle_draw_count_down'];
    adrDownloadLink = json['adr_download_link'];
    iosDownloadLink = json['ios_download_link'];
    liveVersion = json['live_version'];
    challengeEndTime = json['challenge_end_time'];
    challengeMessage = json['challenge_message'];
    primaryCurrency = json['primary_currency'];
    primaryCurrencySymbol = json['primary_currency_symbol'];
    primaryCurrencyRate = json['primary_currency_rate'];
    defaultCurrency = json['default_currency'];
    defaultCurrencySymbol = json['default_currency_symbol'];
    defaultCurrencyRate = json['default_currency_rate'];
    raffleDrawAmount = json['raffle_draw_amount'];
    raffleDrawCurrency = json['raffle_draw_currency'];
    raffleDrawCurrencySymbol = json['raffle_draw_currency_symbol'];
    weeklyDrawTickets = json['weekly_draw_tickets'];
    luckyDrawTickets = json['lucky_draw_tickets'];
    firstPrizeDefault = json['first_prize_default'];
    secondPrizeDefault = json['second_prize_default'];
    thirdPrizeDefault = json['third_prize_default'];
    prizeRangeOneLabel = json['prize_range_one_label'];
    prizeRangeOneDefault = json['prize_range_one_default'];
    prizeRangeTwoLabel = json['prize_range_two_label'];
    prizeRangeTwoDefault = json['prize_range_two_default'];
    firstPrizePrimary = json['first_prize_primary'];
    prizeRangeOnePrimary = json['prize_range_one_primary'];
    prizeRangeTwoPrimary = json['prize_range_two_primary'];
    secondPrizePrimary = json['second_prize_primary'];
    thirdPrizePrimary = json['third_prize_primary'];
    rds_message = json['rds_message'];
    lbs_message = json['lbs_message'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['status'] = this.status;
    data['app_version'] = this.appVersion;
    data['adr_download_link'] = this.adrDownloadLink;
    data['ios_download_link'] = this.iosDownloadLink;
    data['live_version'] = this.liveVersion;
    data['challenge_end_time'] = this.challengeEndTime;
    data['challenge_message'] = this.challengeMessage;
    data['primary_currency'] = this.primaryCurrency;
    data['primary_currency_symbol'] = this.primaryCurrencySymbol;
    data['primary_currency_rate'] = this.primaryCurrencyRate;
    data['default_currency'] = this.defaultCurrency;
    data['default_currency_symbol'] = this.defaultCurrencySymbol;
    data['default_currency_rate'] = this.defaultCurrencyRate;
    data['raffle_draw_amount'] = this.raffleDrawAmount;
    data['raffle_draw_currency'] = this.raffleDrawCurrency;
    data['raffle_draw_currency_symbol'] = this.raffleDrawCurrencySymbol;
    data['weekly_draw_tickets'] = this.weeklyDrawTickets;
    data['lucky_draw_tickets'] = this.luckyDrawTickets;
    data['first_prize_default'] = this.firstPrizeDefault;
    data['second_prize_default'] = this.secondPrizeDefault;
    data['third_prize_default'] = this.thirdPrizeDefault;
    data['prize_range_one_label'] = this.prizeRangeOneLabel;
    data['prize_range_one_default'] = this.prizeRangeOneDefault;
    data['prize_range_two_label'] = this.prizeRangeTwoLabel;
    data['prize_range_two_default'] = this.prizeRangeTwoDefault;
    data['first_prize_primary'] = this.firstPrizePrimary;
    data['prize_range_one_primary'] = this.prizeRangeOnePrimary;
    data['prize_range_two_primary'] = this.prizeRangeTwoPrimary;
    data['second_prize_primary'] = this.secondPrizePrimary;
    data['third_prize_primary'] = this.thirdPrizePrimary;
    data['date'] = this.date;
    return data;
  }
}