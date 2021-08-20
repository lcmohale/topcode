import 'dart:convert';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class AccSearchItemWidget extends StatelessWidget {
  final AccSearchEntity _entity;

  AccSearchItemWidget(this._entity);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _entity.name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: SingleChildScrollView(
        child: Text(_entity.accountBalance.toString()),
      ),
      onTap: () {},
    );
  }
}

class RequestService {
  static Future<AccSearchResponse> query(String search) async {
    var response = await http.get("https://us-central1-momentumtest-bfdef.cloudfunctions.net/app/api/v1/account/findByUserId?userId=$search");
    // Check if response is success
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('U made a request: for ${search} and result is ${response.body}');
      var map = json.decode(response.body);
      return AccSearchResponse.fromJson(map);
    } else {
      print("Query failed: ${search} ${response.body} (${response.statusCode})");
      return null;
    }
  }
}

class AccSearchResponse {
  String batchComplete;
  AccQueryResponse query;
  AccSearchResponse({this.batchComplete, this.query});

  factory AccSearchResponse.fromJson(Map<String, dynamic> json) => AccSearchResponse(batchComplete: json["batchcomplete"], query: AccQueryResponse.fromJson(json["query"]));
}

class AccQueryResponse {
  List<AccSearchEntity> search;

  AccQueryResponse({this.search});

  factory AccQueryResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> resultList = json['search'];
    List<AccSearchEntity> search = resultList.map((dynamic value) => AccSearchEntity.fromJson(value)).toList(growable: false);
    return AccQueryResponse(search: search);
  }
}

class AccSearchEntity {
  int userId;
  String name;
  double accountNumber;
  double accountBalance;

  AccSearchEntity({this.userId, this.name, this.accountBalance, this.accountNumber});

  factory AccSearchEntity.fromJson(Map<String, dynamic> json) => AccSearchEntity(userId: json["userId"], accountNumber: json["accountNumber"], name: json["name"], accountBalance: json["balance"]);
}
