import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
// import 'package:fb_modulex/platform_view.dart';

class HomeManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("房间管理"),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                  children: [EntryItemTopWidget(), EntryItemBottomWidget()]),
            ),
          ),
        ));
  }
}

Container EntryItem(
  Size size,
  String title,
  String number,
  String url,
) {
  return Container(
    width: size.width * 343 / 375,
    height: 50,
    padding: const EdgeInsets.only(top: 16, left: 15, bottom: 16, right: 15),
    color: Colors.white,
    child: InkWell(
        onTap: () => FlutterBoost.singleton.open(url),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      number,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        'assets/images/liveMineMore.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              )
            ])),
  );
}

class EntryItemTopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: EntryItem(size, '管理员', '3', 'second'),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
    );
  }
}

class EntryItemBottomWidget extends StatelessWidget {
  var list;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    list = ListView.separated(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return EntryItem(size, '踢出房间', '4', 'second');
          case 1:
            return EntryItem(size, '禁言管理', '6', 'second');
          case 2:
            return EntryItem(size, '黑词管理', '6', 'second');
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 0.5,
          indent: 15,
          endIndent: 15,
          color: Color.fromRGBO(1, 1, 1, 0.1), // 247, 247, 247
        );
      },
    );

    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: 152,
      child: list,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
    );
  }
}
