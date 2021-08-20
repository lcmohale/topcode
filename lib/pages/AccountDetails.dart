import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AccountDetails extends StatelessWidget {
  final dynamic account;
  const AccountDetails({Key key, this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Details"),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.redAccent[100],
              child: SizedBox(
                width: 300,
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red[500],
                        radius: 90,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage("https://media-exp1.licdn.com/dms/image/C4D0BAQGB0JpwH1M1aA/company-logo_200_200/0/1610481521544?e=2159024400&v=beta&t=GR61I9rNaloXrJF4kr66kt-JQRAx6pKLHlwLQHhcmuM"), //NetworkImage
                          radius: 100,
                        ), //CircleAvatar
                      ), //CirclAvatar
                      SizedBox(
                        height: 10,
                      ), //SizedBox
                      Text(
                        account['name'],
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500,
                        ), //Textstyle
                      ), //Text
                      SizedBox(
                        height: 10,
                      ), //SizedBox
                      Row(
                        children: [
                          Text(
                            'Account Balance: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            (account['balance'] == null) ? "R 0.00" : "R " + account['balance'].toString(),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ), //Text
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            'Account Overdraft: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            (account['overdraft'] == null) ? "R 0.00" : "R " + account['overdraft'].toString(),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Account Number: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            (account['accountNumber']),
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ), //SizedBox
                      SizedBox(
                        width: 180,
                        child: Column(
                          children: [
                            RaisedButton(
                              onPressed: () => null,
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.touch_app),
                                    Text('Withdaw'),
                                  ],
                                ), //Row
                              ), //Padding
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            RaisedButton(
                              onPressed: () => null,
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.touch_app),
                                    Text('Deposit'),
                                  ],
                                ), //Row
                              ), //Padding
                            )
                          ],
                        ), //RaisedButton
                      ) //SizedBox
                    ],
                  ), //Column
                ), //Padding
              ), //SizedBox
            ),
          ],
        ),
      ),
    );
  }
}
