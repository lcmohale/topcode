import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/models.dart';

class AccSearchItemWidget extends StatelessWidget {
  final _entity;

  AccSearchItemWidget(this._entity);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _entity["name"],
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: SingleChildScrollView(
        child: Text(_entity["accountBalance"].toString()),
      ),
      onTap: () {},
    );
  }
}
