import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:another_xlider/another_xlider.dart';
import 'package:minismart/ui/allProduct/filter_provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Filter extends StatefulWidget {
  FilterProvider _controller;


  Filter(this._controller);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  String selectCategoriesValue = 'Tất cả';
  String selectSortValue = "Tên";
  List<String> categories = [
    'Tất cả',
    'Rau củ',
    'Hải sản',
    'Hoa quả trong nước',
    'Hoa quả nhập khẩu',
    'Hoa quả sấy',
    'Thịt các loại',
    'Củ các loại',
    'Hạt các loại',
  ];
  List<String> sortBy = [
    "Tên",
    "Giá tiền",
    "Số lượng đã bán",
  ];
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24)),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration:
              BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_downward,
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: Colors.black26,
                height: 2,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Chọn loại hàng"),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                      items: categories.map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item, style: const TextStyle(fontSize: 14,),),
                      )).toList(),
                      buttonHeight: 40,
                      value: selectCategoriesValue,
                      onChanged: (value) {
                        selectCategoriesValue = value as String;
                        setState(() {
                        });
                      },
                      itemHeight: 40,
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      buttonPadding: const EdgeInsets.only(left: 20, right: 20)
                  )
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Sắp xếp theo"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                      items: sortBy.map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item, style: const TextStyle(fontSize: 14,),),
                      )).toList(),
                      buttonHeight: 40,
                      value: selectSortValue,
                      onChanged: (value) {
                        selectSortValue = value as String;
                        setState(() {
                        });
                      },
                      itemHeight: 40,
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                      ),
                      buttonPadding: const EdgeInsets.only(left: 20, right: 40)
                  )
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: Text("Lọc sản phẩm"),
                onPressed: (){
                  widget._controller.sort = selectSortValue;
                  widget._controller.onButtonFilterClick();
                },
              ),
            )
          ],
        ),
      ),
    );
  }


}
