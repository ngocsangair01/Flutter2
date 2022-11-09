import 'package:flutter/material.dart';
import 'package:infinite_list_app/blocs/imagea_bloc.dart';
import 'package:infinite_list_app/states/ImageaState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfiniteList extends StatefulWidget {
  @override
  State<InfiniteList> createState() => _InfiniteList();
}

class _InfiniteList extends State<InfiniteList> {
  late ExampleBloc bloc;

  //scroll controller
  final _scrollController = ScrollController();
  final _scrollThreadhold = 250.0;

  @override
  void initState() {
    super.initState();
    bloc = ExampleBloc()..init();
    // checkImageValidity(widget.);
  }
  bool imageReady = false;



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<ExampleBloc, ImageaState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ImageaStateInitial) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ImageaStateFailure) {
            return Center(
              child: Text(
                'Cannot load imageas from Server',
                style: TextStyle(fontSize: 22, color: Colors.red),
              ),
            );
          }
          if (state is ImageaStateSuccess) {
            if (state.imageas.isEmpty) {
              return Center(child: Text('Empty imageas !'));
            }
            return ListView.builder(
                itemBuilder: (BuildContext buildContext, int index) {
                  if (index >= state.imageas.length) {
                    return Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.5,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return ListTile(
                      leading: SizedBox(
                        height: 80,
                        width: 80,
                        child: FadeInImage.assetNetwork(
                            placeholder: 'assets/images/amalie-steiness.gif',
                            image: state.imageas[index].url),
                        // child: _getImage(),
                      ),
                      title: Text('${state.imageas[index].title}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      isThreeLine: true,
                      subtitle: Text('${state.imageas[index].url}',
                           style: TextStyle(fontSize: 18)),
                    );
                  }
                },
                itemCount: state.imageas.length,
                controller: _scrollController);
          }
          return Center(
              child: Text(
                  'Other states..')); //never run this line, only fix warning.
        },
      )),
    );
  }
}
