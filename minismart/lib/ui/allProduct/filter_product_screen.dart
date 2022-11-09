import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minismart/model/product.dart';
import 'package:minismart/ui/allProduct/filter.dart';
import 'package:minismart/ui/allProduct/filter_provider.dart';
import 'package:minismart/ui/productDetail/product_detail_screen.dart';
import 'package:minismart/util/colors.dart';
import 'package:minismart/util/contants.dart';
import 'package:minismart/util/styles.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FilterProductScreen extends StatelessWidget {
  String? search;
  Map<String, dynamic>? category;

  FilterProductScreen({Key? key, this.search, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider<FilterProvider>.value(
        value: FilterProvider(search: search, category: category),
        child: const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatefulWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<_BodyWidget> {

  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );
  late FilterProvider _provider;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      if(!_controller.hasClients) return;

      final thresholdReached = _controller.position.extentAfter == 0.0;
      // print(_controller.position.extentAfter);
      if (thresholdReached) {
        // Load more!
        _provider.loadMore();
      }
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _provider = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Bộ lọc sản phẩm"),
          centerTitle: true
          ),
        body: SlidingUpPanel(
          backdropColor: Colors.white,
          backdropEnabled: true,
          backdropTapClosesPanel: true,
          maxHeight: 300,
          controller: _provider.slideUpController,
          minHeight: 42,
          color: Colors.blueGrey,
          panel: Filter(_provider),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24)),
          collapsed: Container(
            decoration:
            BoxDecoration(color: Colors.blueGrey, borderRadius: radius),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                Text(
                  "Bộ lọc",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          body: buildBody(),
        ),
      ),
    );
  }

  Widget buildBody(){
    return Column(
      children: [
        SizedBox(height: 15,),
        _searchField(),
        SizedBox(height: 20,),
        Expanded(
          child: _provider.loading ? Center(child: CircularProgressIndicator(),):ListView(
            controller: _controller,
            children: [
              _provider.search == null?Container(): Container(

                  child: Text("Có ${_provider.total} sản phẩm phù hợp cho \"${_provider.search}\"",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: primaryMaterialColor),),
                margin: EdgeInsets.symmetric(horizontal: 15),
              ),
              _provider.category == null?Container(): Container(

                child: Text(_provider.category!['text'],
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: primaryMaterialColor),),
                margin: EdgeInsets.symmetric(horizontal: 15),
              ),
              SizedBox(height: 16,),
              buildAllProduct()
            ],
          ),
        ),
      ],
    );
  }

  Widget _searchField() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF979797).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) => print(value),
        decoration: const InputDecoration(
            fillColor: Colors.white,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Tìm kiếm",
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }

  Widget buildAllProduct() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: _provider.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (context, index) {
          return buildListItem(_provider.products[index]);
        });
  }

  Widget buildListItem(Product? product) {
    double leftMargin = 10;
    double rightMargin = 10;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product!)));
      },
      child: Padding(
        padding:
        EdgeInsets.only(left: leftMargin, right: rightMargin, bottom: 10),
        child: Card(
          elevation: 5,
          child: Column(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: Image.network(
                      product!.pictures[0],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                flex: 75,
              ),
              Expanded(
                flex: 25,
                child: Container(
                  padding:
                  EdgeInsets.only(left: leftMargin, right: rightMargin),
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 8),
                      Text(
                        product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                            color: Colors.black.withOpacity(.7), fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${formatMoney(product.price)}/${product.unit}",
                        style: CustomTextStyle.textFormFieldSemiBold.copyWith(
                            color: primaryMaterialColor, fontSize: 10),
                      )
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

