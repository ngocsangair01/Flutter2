import 'dart:async';
import 'dart:convert';
import 'album.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'get_api.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Fetch Data Example'),
          ),
          body: Center(
            child: FutureBuilder<List<Album>>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder:(BuildContext buildContext,int index){
                      if(index >= snapshot.data!.length){
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
                      } else{
                        return ListTile(
                          leading: Text('${snapshot.data![index].id}'),
                          title: Text('${snapshot.data![index].title}'),
                          isThreeLine: true,
                          subtitle: Text('${snapshot.data![index].userId}'),
                        );
                      }
                    },
                    itemCount: snapshot.data!.length,
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}