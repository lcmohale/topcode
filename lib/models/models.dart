class userAccount {
  String id;
  String userId;
  String name;
  double accountNumber;
  double accountBalance;
  double accountOverdraft;
  var modified = DateTime;
  var created = DateTime;

  userAccount({this.id, this.userId, this.name, this.accountBalance, this.accountNumber, this.accountOverdraft, this.created, this.modified});

  factory userAccount.fromJson(Map<String, dynamic> json) =>
	userAccount(id: json["id"],
	userId: json["userId"],
	name: json["name"],
	accountNumber: json["accountNumber"],
	accountBalance: json["balance"],
	accountOverdraft: json["overdraft"],
	modified: json["modified"],
	created: json["created"]);
}
