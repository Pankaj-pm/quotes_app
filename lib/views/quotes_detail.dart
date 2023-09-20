import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotesDetail extends StatefulWidget {
  const QuotesDetail({Key? key}) : super(key: key);

  @override
  State<QuotesDetail> createState() => _QuotesDetailState();
}

class _QuotesDetailState extends State<QuotesDetail> {
  Color color = Colors.black;

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.cyan,
    Colors.brown,
    Colors.orange
  ];
  List<TextStyle> fonts = [
    GoogleFonts.lato(),
    GoogleFonts.dancingScript(),
    GoogleFonts.freehand(),
    GoogleFonts.megrim(),
    GoogleFonts.moul(),
  ];

  int cIndex=0;
  int fIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuotesDetail"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.black12,
              child: Center(
                  child: Text(
                "Quotes",
                // style: fonts[fIndex].copyWith(color: colors[cIndex],fontSize: 35),
                style: TextStyle(fontFamily: "Schyler"),
              )),
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.all(10),
            color: Colors.black12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    fIndex=index;
                    setState(() {

                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Aa",
                        style: fonts[index].copyWith(fontSize: 40),
                      )),
                );
              },
              itemCount: fonts.length,
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(10),
            color: Colors.black12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    cIndex=index;
                    setState(() {
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    color: colors[index],
                    margin: EdgeInsets.all(10),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
