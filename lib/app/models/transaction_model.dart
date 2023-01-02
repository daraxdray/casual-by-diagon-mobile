class TransactionModel {
  String? user;
  String? type;
  String? name;
  int? amount;
  bool? status;
  String? data;

  TransactionModel(
      {this.user, this.type, this.name, this.amount, this.status, this.data});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    type = json['type'];
    name = json['name'];
    amount = json['amount'];
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['type'] = this.type;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['data'] = this.data;
    return data;
  }
}
