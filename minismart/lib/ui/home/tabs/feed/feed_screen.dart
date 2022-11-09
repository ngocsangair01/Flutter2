import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:minismart/ui/home/tabs/feed/feed_detail_screen.dart';
import 'package:minismart/ui/home/tabs/feed/feed_provider.dart';
import 'package:minismart/util/colors.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FeedProvider>.value(
        value: FeedProvider(),
        child: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatefulWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> {

  late FeedProvider _provider;

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
        title: const Text("Tin tức"),
        centerTitle: true,
      ),
      body: _provider.loading
          ?Center(child: CircularProgressIndicator(),)
          :ListView.builder(
          itemCount: _provider.posts.length,
          itemBuilder: (context,index){
            var post = _provider.posts[index];
            String des = post.description.substring(post.description.indexOf("<p>")+3,post.description.indexOf("</p>"));
            return InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeedDetailScreen(post: post)));
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                elevation: 5,
                child: ListTile(
                  isThreeLine: true,
                  title: Text(post.title),
                  leading: Image.network(post.pictures[0]),
                  subtitle:Text(des,maxLines: 3,overflow: TextOverflow.ellipsis,),

                ),
              ),
            );
          }
      )
      ,
    );
  }
}

