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

  List<String> img = [
    "assets/Daco_4599778.png",
    "assets/i1.jpg",
    "assets/pngwing.com.png",
    "assets/red-wall-with-white-spray-background.jpg",
    "assets/pexels.jpg"
  ];

  int cIndex = 0;
  int fIndex = 0;
  int? iIndex;
  String text = "";
  double textSize = 12;
  bool isBold = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuotesDetail"),
        actions: [
          IconButton(
              onPressed: () {
                cIndex = 0;
                fIndex = 0;
                iIndex = null;
                text = "";
                textSize = 12;
                isBold = false;
                setState(() {});
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.black12,
              child: Stack(
                children: [
                  if (iIndex != null)
                    Positioned.fill(
                      child: Image.asset(img[iIndex!], fit: BoxFit.cover),
                    ),
                  Center(
                    child: Text(
                      text,
                      style: fonts[fIndex].copyWith(
                          color: colors[cIndex],
                          fontSize: textSize,
                          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
                      // style: TextStyle(fontFamily: "Schyler",fontSize: textSize,fontWeight: isBold ? FontWeight.bold:FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Text",
              fillColor: Colors.grey,
              filled: true,
              // border: OutlineInputBorder.none
            ),
            onChanged: (value) {
              text = value;
              setState(() {});
            },
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    textSize++;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.format_size,
                    size: 28,
                  )),
              IconButton(
                  onPressed: () {
                    textSize--;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.format_size,
                    size: 20,
                  )),
              IconButton(
                  onPressed: () {
                    isBold = !isBold;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.format_bold,
                    size: 20,
                  )),
            ],
          ),
          Container(
            height: 100,
            margin: EdgeInsets.all(10),
            color: Colors.black12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    fIndex = index;
                    setState(() {});
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
                    cIndex = index;
                    setState(() {});
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
          Container(
            height: 60,
            margin: EdgeInsets.all(10),
            color: Colors.black12,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: img.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    iIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.all(10),
                    child: Image.asset(img[index]),
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
