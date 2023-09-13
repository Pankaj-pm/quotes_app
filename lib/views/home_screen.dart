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
      body: Column(
        children: quotesList.map((e) {
          QuotesModel quotesModel=QuotesModel.fromMap(e);
          List<Color> color=quotesModel.colors?.map((e) {
            int? c= int.tryParse("0xff$e");

            return Color(c??0xffffffff);
          }).toList()??[];


          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: color
              )
            ),
            child: Text(quotesModel.quotes??""),
          );
        }).toList(),
      ),
    );
  }
}
