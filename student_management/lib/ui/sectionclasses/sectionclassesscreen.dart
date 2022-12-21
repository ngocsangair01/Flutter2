import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/ui/sectionclasses/section_classes_list.dart';
import 'package:student_management/ui/sectionclasses/session_provider.dart';

class SectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SessionProvider>.value(
      value: SessionProvider(),
      child: _SectionClasses(),
    );
  }
}

class _SectionClasses extends StatefulWidget {
  @override
  State<_SectionClasses> createState() => _SectionClassesState();
}

class _SectionClassesState extends State<_SectionClasses> {
  late SessionProvider _provider;

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
        title: Text('List Of Section Classes'),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Hello, Mr.Sang',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(Icons.qr_code),
                              const SizedBox(
                                width: 7,
                              ),
                              Icon(Icons.notifications),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'List Section',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SectionClassesList(_provider),
                ],
              ),
            ),
    );
  }
}
