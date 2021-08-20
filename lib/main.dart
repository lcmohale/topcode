import 'package:flutter/cupertino.dart';
import 'services/api.dart';
import 'widgets/widgets.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Code API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Top Code User Api'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final searchTextController = TextEditingController();
  var accountList = [];

  void _search() {
    String str = searchTextController.text;
    RequestService.query(str).then((response) {
      setState(() {
        accountList = response;
        if (accountList == null) {
          accountList = [];
        }
      });
    });
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Enter Account"),
              Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(
                  child: TextField(
                    controller: searchTextController..text = "UZyMgwSApiN0b148VDrZSAeWkfb2",
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Account Number',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: double.infinity,
                child: OutlineButton(
                  color: Colors.blueGrey,
                  onPressed: _search,
                  highlightColor: Colors.lightBlue,
                  child: Text("View Accounts"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                    primary: false,
                    itemBuilder: (BuildContext context, int index) => new AccSearchItemWidget(accountList[index]),
                    itemCount: accountList.length,
                    shrinkWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
