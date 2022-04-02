// --- package ---
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

// import 'search/search.dart';
// --- widget ---
import '../screens/search/endDrawer.dart';
import 'package:myFirst/screens/search/items/searchField.dart';
import '../screens/search/items/categoryList.dart';
import '../screens/search/items/itemList.dart';
// --- model ---
import 'package:myFirst/models/search_model.dart';

class SearchMain extends StatelessWidget {
  // final bottomBarController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // SearchMain({@required this.bottomBarController});

  @override
  Widget build(BuildContext context) {
    void _openEndDrawer() => _scaffoldKey.currentState.openEndDrawer();
    // ignore: unused_element
    void _closePage() => Navigator.of(context).pop();
    print('build Search');

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "搜尋",
          style: Theme.of(context).textTheme.headline1,
        ),
        // actions: [
        //   SvgPicture.asset(
        //     "assets/images/search/drawerButton.svg",
        //     width: 20,
        //     // color: Colors.amber,
        //   )
        // ],
      ),
      // endDrawer: SearchEndDrawer(),
      body: Column(
        children: [
          // ----search box----
          Card(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<SearchModel>(
                    builder: (_, localNotify, __) => IconButton(
                      onPressed: () async {
                        localNotify.searchResult(await fetchAlbum("123"));
                      },
                      icon: Icon(Icons.search),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed("/search/box"),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Selector<SearchModel, String>(
                          selector: (_, viewModel) => viewModel.keyword,
                          builder: (buildContext, keyword, widget) => Text(
                            "python",
                            // keyword,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(icon: Icon(Icons.sort), onPressed: () {})
                ],
              ),
            ),
          ),

          // ---- category ----
          // CategoryList(),
          // ---- item container ----
          Expanded(
            child: ItemList(
              // controller: bottomBarController,
            ),
          )
        ],
      ),
    );
  }
}

Future fetchAlbum(String value) async {
  var dio = Dio();

  final response = await dio
      .get(
        // "http://192.168.43.159:8000/s/test/",
        // "http://210.70.80.111/106021095/myjson.json", // school url get json
        "http://210.70.80.111/106021095/json/kingstoneMult.json",
        // queryParameters: {"id": 12, "name": "wendu"}
      )
      .timeout(const Duration(seconds: 10));
  if (response.statusCode == 200) {
    return response.data;
  } else {
    return null;
  }
}
