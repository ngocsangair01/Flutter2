import 'package:dung_dat_deo/blocs/SubjectBloc.dart';
import 'package:dung_dat_deo/states/SubjectState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dung extends StatefulWidget {
  const Dung({Key? key}) : super(key: key);

  @override
  State<Dung> createState() => _DungState();
}

class _DungState extends State<Dung> {
  late SubjectBloc subjectBloc;
  final _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subjectBloc = SubjectBloc()..init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Container(
              child: BlocBuilder<SubjectBloc, SubjectState>(
                bloc: subjectBloc,
                builder: (context, state) {
                  if (state is SubjectStateInitial) {
                    return CircularProgressIndicator();
                  }
                  if (state is SubjectStateFailure) {
                    return Center(
                      child: Text(
                        'Error Server',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    );
                  }
                  if (state is SubjectStateSuccess) {
                    if (state.subjects.isEmpty) {
                      return Center(
                        child: Text(
                          'Empty',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemBuilder: (BuildContext buildContext, int index) {
                        if(index >= state.subjects.length) {
                          return CircularProgressIndicator();
                        }else{
                          return ListTile(
                            leading: Text(state.subjects[index].avatar),
                            title: Text(state.subjects[index].name),
                            subtitle: Text(state.subjects[index].description),
                          );
                        }
                      },
                      itemCount: state.subjects.length,
                      controller: _scrollController,
                    );
                  }
                  return Center(
                    child: Text('Something else'),
                  );
                },
              ),
            ));
  }
}
