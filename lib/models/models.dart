class userAccount {
  String id;
  String userId;
  String name;
  String accountNumber;
  String accountBalance;
  String accountOverdraft;
  var modified = DateTime.now().toString();
  var created = DateTime.now().toString();

  userAccount({this.id, this.userId, this.name, this.accountBalance, this.accountNumber, this.accountOverdraft, this.created, this.modified});

  factory userAccount.fromJson(Map<dynamic, dynamic> json) => userAccount(id: json["id"], userId: json["userId"], name: json["name"], accountNumber: json["accountNumber"], accountBalance: json["balance"], accountOverdraft: json["overdraft"], modified: json["modified"], created: json["created"]);
}
