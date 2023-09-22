
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes_app/model/quotes_model.dart';
import 'package:quotes_app/util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                isGrid = !isGrid;
                setState(() {});
              },
              icon: Icon(Icons.grid_on)),
        ],
      ),
      body: isGrid
          ? Scrollbar(
              thickness: 50,
              radius: Radius.circular(10),
              trackVisibility: true,
              child: GridView.builder(
                itemCount: quotesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context, index) {
                  Map qt = quotesList[index];
                  var quotesModel = QuotesModel.fromMap(qt);
                  List<Color> color = quotesModel.colors?.map((e) {
                        int? c = int.tryParse("0xff$e");
                        return Color(c ?? 0xffffffff);
                      }).toList() ??
                      [];
                  return InkWell(
                    onTap: () {
                      showMyDialog(quotesModel);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(gradient: LinearGradient(colors: color)),
                      child: Text(quotesModel.quotes ?? ""),
                    ),
                  );
                },
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                Map qt = quotesList[index];
                var quotesModel = QuotesModel.fromMap(qt);
                List<Color> color = quotesModel.colors?.map((e) {
                      int? c = int.tryParse("0xff$e");
                      return Color(c ?? 0xffffffff);
                    }).toList() ??
                    [];
                return InkWell(
                  onTap: () {
                    showMyDialog(quotesModel);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(gradient: LinearGradient(colors: color)),
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () async {
                              print("${quotesModel.quotes}");
                              await Clipboard.setData(ClipboardData(text: quotesModel.quotes));

                              print("Copy ${Clipboard.kTextPlain}");
                              var data = await Clipboard.getData(Clipboard.kTextPlain);
                              // ClipboardManager
                              print(data?.text);
                            },
                            icon: Icon(Icons.copy)),
                        Text(quotesModel.quotes ?? ""),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 5,
                );
              },
              itemCount: quotesList.length),

      /*body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        reverse: true,
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.greenAccent,
          ),
        ],
      ),*/
      // body: GridView.builder(
      //   // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   //   crossAxisCount: 5,
      //   //   mainAxisSpacing: 2,
      //   //   crossAxisSpacing: 2,
      //   //   // mainAxisExtent: 50,
      //   //   // childAspectRatio: 0.5
      //   // ),
      //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //     maxCrossAxisExtent: 50,
      //     crossAxisSpacing: 2,
      //     mainAxisSpacing: 2
      //   ),
      //   itemBuilder: (context, index) {
      //     bool isOddEven=index%2==0;
      //     return LayoutBuilder(
      //       builder: (context,box) {
      //         print("maxWidth ${box.maxWidth}");
      //         print("minWidth ${box.minWidth}");
      //         return Container(
      //           color: isOddEven?Colors.black12 :Colors.white,
      //           child: Text("${index+1}"),
      //         );
      //       }
      //     );
      //   },
      //   itemCount: 100,
      //   physics: BouncingScrollPhysics(),
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // var nextInt = Random().nextInt(6);
          // Map qt = quotesList[nextInt];
          // QuotesModel quotesModel = QuotesModel.fromMap(qt);
          //
          // showMyDialog(quotesModel);
          Navigator.pushNamed(context, "quotesPage");
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  void showMyDialog(QuotesModel quotesModel) {
    List<Color> color = quotesModel.colors?.map((e) {
          int? c = int.tryParse("0xff$e");
          return Color(c ?? 0xffffffff);
        }).toList() ??
        [];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Quotes"),
          backgroundColor: color.first,
          content: Text(quotesModel.quotes ?? ""),
        );
      },
    );
  }
}
