class GameResult {
  String? scope;
  String? title;
  String? gameID;
  int? gameTime;
  String? event;
  Params? params;
  int? accumulated;
  String? image;
  DateTime time = DateTime.now();
  GameResult({this.scope, this.gameID, this.gameTime, this.event, this.params, this.accumulated, this.title});
  GameResult.fromJson(Map<String, dynamic> json) {
    scope = json['scope'];
    gameID = json['gameID'];
    gameTime = json['gameTime'];
    event = json['event'];
    title = json['title'];
    params =
    json['params'] != null ? Params.fromJson(json['params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scope'] = this.scope;
    data['gameID'] = this.gameID;
    data['gameTime'] = this.gameTime;
    data['event'] = this.event;
    data['title'] = this.title;
    data['image'] = this.image;
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
    levelName = json['levelName'] ?? json['eventName'];
    reason = json['reason'];
    levelScore = json['levelScore'] ?? json['score'] ;
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

