import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/AccountDetails.dart';

class AccSearchItemWidget extends StatelessWidget {
  final _entity;

  AccSearchItemWidget(this._entity);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            'Account Name: ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            _entity["name"],
          )
        ],
      ),
      subtitle: SingleChildScrollView(
        child: Row(
          children: [
            Text(
              'Account Balance: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              (_entity['balance'] == null) ? "R 0.00" : "R " + _entity['balance'].toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountDetails(account: _entity)),
        );
      },
    );
  }
}
