import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quotes_app/model/quotes_model.dart';
import 'package:quotes_app/util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
        centerTitle: true,
      ),
      // body: Column(
      //   children: quotesList.map((e) {
      //     QuotesModel quotesModel = QuotesModel.fromMap(e);
      //
      //     List<Color> color = quotesModel.colors?.map((e) {
      //           int? c = int.tryParse("0xff$e");
      //           return Color(c ?? 0xffffffff);
      //         }).toList() ??
      //         [];
      //
      //     return InkWell(
      //       onTap: () {
      //         showMyDialog(quotesModel);
      //       },
      //       child: Container(
      //         margin: EdgeInsets.all(10),
      //         padding: EdgeInsets.all(10),
      //         decoration: BoxDecoration(gradient: LinearGradient(colors: color)),
      //         child: Text(quotesModel.quotes ?? ""),
      //       ),
      //     );
      //   }).toList(),
      // ),

      /// simple List View
      // body: ListView(
      //   padding: EdgeInsets.symmetric(vertical: 20),
      //   // scrollDirection: Axis.vertical,
      //   // reverse: true,
      //   // physics: BouncingScrollPhysics(),
      //   children: [
      //     //.... List of Widget
      //   ],
      // ),

      /// ListView builder name constructor
      // body: ListView.builder(
      //   itemBuilder: (context, index) {
      //     QuotesModel quotesModel = QuotesModel.fromMap(quotesList[index]);
      //     List<Color> color = quotesModel.colors?.map((e) {
      //       int? c = int.tryParse("0xff$e");
      //       return Color(c ?? 0xffffffff);
      //     }).toList() ??
      //         [];
      //
      //     return InkWell(
      //       onTap: () {
      //         showMyDialog(quotesModel);
      //       },
      //       child: Container(
      //         margin: EdgeInsets.all(10),
      //         padding: EdgeInsets.all(10),
      //         decoration: BoxDecoration(gradient: LinearGradient(colors: color)),
      //         child: Text(quotesModel.quotes ?? ""),
      //       ),
      //     );
      //   },
      //   itemCount: quotesList.length,
      // ),

      /// ListView separated name constructor
      body: ListView.separated(
          itemBuilder: (context, index) {
            Map qt = quotesList[index];
            var quotesModel = QuotesModel.fromMap(qt);

            return Text(quotesModel.quotes ?? "");
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 5,
            );
          },
          itemCount: quotesList.length),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var nextInt = Random().nextInt(6);
          Map qt = quotesList[nextInt];
          QuotesModel quotesModel = QuotesModel.fromMap(qt);

          showMyDialog(quotesModel);
          print(nextInt);
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
