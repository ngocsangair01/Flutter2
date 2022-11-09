import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minismart/components/base_view.dart';
import 'package:minismart/model/product.dart';
import 'package:minismart/ui/allProduct/filter_product_screen.dart';
import 'package:minismart/ui/home/tabs/cart/cart_screen.dart';
import 'package:minismart/ui/home/tabs/home/home_provider.dart';
import 'package:minismart/ui/productDetail/product_detail_screen.dart';
import 'package:minismart/util/colors.dart';
import 'package:minismart/util/contants.dart';
import 'package:minismart/util/styles.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Container(
        //
        //       child: Image.asset("assets/images/logo_1.png",width: 120,height: 80,)),
        //   backgroundColor: Colors.white,
        //   centerTitle: true,
        // ),
        body: ChangeNotifierProvider<HomeProvider>.value(
          value: HomeProvider(),
          child: Builder(
            builder: (context) => const BodyWidget(),
          ),
        ),
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  late HomeProvider _provider;
  final ScrollController _controller = ScrollController();
  final TextEditingController textEditingController = TextEditingController();

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
    var height = MediaQuery.of(context).size.height;
    return Builder(
      builder: (context) {
        return _provider.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
              controller: _controller,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    // Container(
                    //   color: primaryMaterialColor,
                    //   height: height / 4,
                    // ),
                    _homeHeader(),
                    /*Slider Section*/
                    Container(
                        height: (height / 4) + 75,
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                            height: height / 5,
                            width: 400,
                            child: CarouselSlider(
                              items: _provider.slideImage
                                  .map((e) => createSlider(e))
                                  .toList(),
                              options: CarouselOptions(
                                viewportFraction: 1,
                                initialPage: 0,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval:
                                    const Duration(seconds: 10),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 5000),
                                scrollDirection: Axis.horizontal,
                              ),
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                _buildCategories(),
                const SizedBox(
                  height: 30,
                ),
                buildGroup("Sản phẩm bán chạy", _provider.bestSellProducts),
                const SizedBox(
                  height: 15,
                ),
                buildAllProduct(),
                // _provider.isLoadingMore
                //     ? Container(
                //   padding: EdgeInsets.only(bottom: 16),
                //   alignment: Alignment.center,
                //   child: CircularProgressIndicator(),
                // )
                //     : SizedBox(),
              ],
            );
      },
    );
  }

  Widget createSlider(String image) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.fitWidth)),
      ),
    );
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

  Widget buildGroup(String title, List<Product> products) {
    return products.isEmpty
        ? Container(
            alignment: Alignment.center,
            height: 150,
            child: const CircularProgressIndicator(),
          )
        : Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CartScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 16),
                      child: Text(
                        title,
                        style: CustomTextStyle.textFormFieldSemiBold
                            .copyWith(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /*Group By Product Listing*/
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildListItem(products[index]);
                  },
                  itemCount: products.length,
                ),
              ),
            ],
          );
  }

  Widget buildAllProduct() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  FilterProductScreen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 16),
                child: Text(
                  "Tất cả sản phẩm",
                  style: CustomTextStyle.textFormFieldSemiBold
                      .copyWith(color: Colors.black, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: _provider.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (context, index) {
              return buildListItem(_provider.products[index]);
            })
      ],
    );
  }

  Widget _buildCategories() {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/images/icon_vegetable.svg",
        "text": "Rau củ",
        "id":"6166f5b32c7abe37b573ef1a"
      },
      {"icon": "assets/images/ic_seafood.svg",
        "text": "Hải sản",
        "id":"6166f5ba2c7abe37b573ef1c"
      },
      {"icon": "assets/images/ic_fruit.svg",
        "text": "Hoa quả trong nước",
        "id":"6166f5cb2c7abe37b573ef1e"
      },
      {
        "icon": "assets/images/ic_fruit_import.svg",
        "text": "Hoa quả nhập khẩu",
        "id":"6166f5d22c7abe37b573ef20"
      },
      {"icon": "assets/images/dried_fruits.svg",
        "text": "Hoa quả sấy",
        "id":"6166f5e52c7abe37b573ef22"
      },
      {"icon": "assets/images/tuber.svg",
        "text": "Củ các loại",
        "id":"6166f5ec2c7abe37b573ef24"
      },
      {"icon": "assets/images/meat.svg",
        "text": "Thịt các loại",
        "id":"6166f6072c7abe37b573ef26"
      },
      {"icon": "assets/images/seed.svg",
        "text": "Hạt các loại",
        "id":"6166f60e2c7abe37b573ef28"
      },
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: GridView.builder(
        itemCount: 8,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (context, index) => CategoryCard(
          icon: categories[index]["icon"],
          text: categories[index]["text"],
          press: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilterProductScreen(category: categories[index],)));
          },
        ),
      ),
    );
  }

  Widget _searchField() {
    return Container(
      width: SizeConfig.screenWidth * 0.75,
      decoration: BoxDecoration(
        color: const Color(0xFF979797).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: textEditingController,
        textInputAction: TextInputAction.search,
        onSubmitted: (text){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilterProductScreen(search: text,)));
        },
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

  Widget _homeHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _searchField(),
          _iconBtnWithCounter(
            svgSrc: "assets/images/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }

  _iconBtnWithCounter(
      {required String svgSrc,
      required int numOfitem,
      required void Function() press}) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: const Color(0xFF979797).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: getProportionateScreenWidth(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 50,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                icon!,
                color: const Color(0xFFFF7643),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
