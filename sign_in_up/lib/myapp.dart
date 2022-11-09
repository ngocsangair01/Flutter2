import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sign_in_up/infor/infor.dart';
import 'package:sign_in_up/infor/inforlist.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  int? id;
  String? name;
  int? age;
  String? address;
  String? account;
  String? password;
  Infor _infor = Infor(id: null,name: '',age: null,address: '',account: '',password: '',);
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  List<Infor> _inforList = <Infor>[
    Infor(
        id: 2019602301,
        name: 'Ngo Ngoc Sang',
        age: 21,
        address: 'Nam Dinh',
        account: 'ngocsangair01',
        password: '123'),
    Infor(
        id: 2020605590,
        name: 'Ngo Ngoc Sang 2',
        age: 21,
        address: 'Nam Dinh 2',
        account: 'ngocsangair02',
        password: '123')
  ];

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
  // add information of student
  Widget _addInfor(){
    return Container(
      child: Stack(
        children: [
          TextField(
            decoration: InputDecoration(
                labelText: 'Ma Sinh Vien'
            ),
            controller: _idController,
            onChanged: (text){
              this.setState(() {
                _infor.id= int.parse(text);
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Ten Sinh Vien'
            ),
            controller: _nameController,
            onChanged: (text){
              this.setState(() {
                _infor.name= text;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Tuoi Sinh Vien'
            ),
            controller: _ageController,
            onChanged: (text){
              this.setState(() {
                _infor.age= int.parse(text);
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Dia Chi Sinh Vien'
            ),
            controller: _addressController,
            onChanged: (text){
              this.setState(() {
                _infor.address= text;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Tai Khoan Sinh Vien'
            ),
            controller: _accountController,
            onChanged: (text){
              this.setState(() {
                _infor.account= text;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Ma Sinh Vien'
            ),
            controller: _passwordController,
            onChanged: (text){
              this.setState(() {
                _infor.password= text;
              });
            },
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print('Hello');
                this._addInfor();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        // minimum: EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 35)),
              Text(
                'List of student',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  // color: Colors.red,
                  // color: Color.fromARGB(100, 1, 46, 79),
                  color: Color.fromRGBO(0, 46, 79, 100),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              InforList(infors: _inforList),
            ],
          ),
        ),
      ),
    );
  }
}
