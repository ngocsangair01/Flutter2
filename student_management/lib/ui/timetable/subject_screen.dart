import '../../ui/timetable/subject_provider.dart';
import '../../ui/timetable/subject_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SubjectProvider>.value(
      value: SubjectProvider(),
      child: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatefulWidget {
  @override
  State<_BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> {
  late SubjectProvider _provider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _provider = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
        centerTitle: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Image(
              image: AssetImage("assets/images/img.png"),
              height: 40,
              width: 40,
            ),
          ),
        ],
        backgroundColor: Colors.redAccent,
      ),
      body: _provider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Time table',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SubjectList(_provider),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
