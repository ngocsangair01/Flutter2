import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'transaction.dart';
import 'transactionlist.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  String? _email;
  String? _password;
  Transaction _transaction = Transaction('', '');
  List<Transaction> _transactions = <Transaction>[];
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    print('Init State');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    print('Dispose');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('App is in background');
    } else if (state == AppLifecycleState.resumed) {
      print('App is running');
    }
  }

  void _insertTransaction() {
    print('1');
    if (_transaction.email!.isEmpty || _transaction.password!.isEmpty) {
      print('2');
      _scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
        content: Text('Email or password must not empty'),
        duration: Duration(seconds: 3),
      ));
      // Scaffold(
      //   key: _scaffoldMessengerKey,
      //   body: ,
      // );
    } else {
      for (int i = 0; i < _transactions.length; i++) {
        if (_transaction.email!
                    .compareTo(_transactions.elementAt(i).email.toString()) ==
                0 ||
            _transaction.email!
                    .compareTo(_transactions.elementAt(i).email.toString()) ==
                0) {
          print('3');
          _scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
            content: Text('Email or password already exists'),
            // duration: Duration(seconds: 3),
          ));
          return;
        }
      }
      _transactions.add(_transaction);
      _transaction = Transaction('', '');
      _emailController.text = '';
      _passwordController.text = '';
    }
  }

  void _onButtonShowModalSheet() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return Container(
            color: Colors.white,
            margin: EdgeInsets.all(30),
            child: Wrap(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: TextField(
                    autofillHints: [AutofillHints.email],
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    onChanged: (text) {
                      this.setState(() {
                        _transaction.email = text;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(const Radius.circular(20)),
                        ),
                        labelText: 'Email'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    onChanged: (text) {
                      this.setState(() {
                        _transaction.password = text;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                          const BorderRadius.all(const Radius.circular(20)),
                        ),
                        labelText: 'Password'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment(0.8, 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          fixedSize: Size(80, 25),
                          shadowColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          print('press the button');
                          print(
                              'Email: - ${_transaction.email} - Password: - ${_transaction.password}');
                          setState(() {
                            this._insertTransaction();
                          });
                        },
                        child: Text('Save'),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          fixedSize: Size(80, 25),
                          shadowColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          print('press the button');
                          print(
                              'Email: - ${_transaction.email} - Password: - ${_transaction.password}');
                          setState(() {
                            this._insertTransaction();
                          });
                        },
                        child: Text('Cancel'),
                      ),
                      Padding(padding: EdgeInsets.only(right: 20)),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add transaction',
        child: Icon(Icons.accessible_outlined),
        onPressed: () {
          this.setState(() {
            this._insertTransaction();
          });
        },
      ),
      appBar: AppBar(
        title: const Text('Transaction Manager'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print('U press add');
              this._onButtonShowModalSheet();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Log in',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [],
                ),
              ),
              TransactionList(
                transactions: _transactions,
              )
            ],
          ),
        ),
      ),
    );
  }
}
