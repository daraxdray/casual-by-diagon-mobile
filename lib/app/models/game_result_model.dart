class GameResult {
  String? scope;
  String? gameID;
  int? gameTime;
  String? event;
  Params? params;
  int? accumulated;

  GameResult({this.scope, this.gameID, this.gameTime, this.event, this.params, this.accumulated});
  String get gameName => gameID?.replaceAll("-", " ").toUpperCase() ?? "Name Unknown";
  GameResult.fromJson(Map<String, dynamic> json) {
    scope = json['scope'];
    gameID = json['gameID'];
    gameTime = json['gameTime'];
    event = json['event'];
    params =
    json['params'] != null ? Params.fromJson(json['params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scope'] = this.scope;
    data['gameID'] = this.gameID;
    data['gameTime'] = this.gameTime;
    data['event'] = this.event;
    if (this.params != null) {
      data['params'] = this.params!.toJson();
    }
    return data;
  }
}

class Params {
  String? levelName;
  String? reason;
  int? levelScore;
  int? totalScore;
  Params({this.levelName, this.reason, this.levelScore});

  Params.fromJson(Map<String, dynamic> json) {
    levelName = json['levelName'];
    reason = json['reason'];
    levelScore = json['levelScore'];
    totalScore = json['totalScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['levelName'] = levelName;
    data['reason'] = reason;
    data['levelScore'] = levelScore;
    data['totalScore'] = totalScore;
    return data;
  }
}

