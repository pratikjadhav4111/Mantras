import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List namedList = ['all', 'Shiva', 'Krishna', 'Ganesha', 'Durga'];

  List<Map> songList = [
    {
      'picture':
          'https://imgs.search.brave.com/cVvOA76DEdceDk5I9IUc2W9kHWUAmbCU52495O8jM2Q/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzNhLzQ3/LzBhLzNhNDcwYTFl/MzBjOGMyMzA3ZWFm/MWIzMDhlOGY2YTM1/LmpwZw',
      'title': 'Om Ganeshay Namah',
      'time': '5:30',
    },
    {
      'picture':
          'https://imgs.search.brave.com/KKc8HkrtiOvg6mtGoWGL9V65AIbfw_xyGtEwLDmNQ6U/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2YxLzlk/LzUzL2YxOWQ1M2Jj/OTVhMmYzNmJjOTdl/MzQ2NGJiZjZlN2I4/LmpwZw',
      'title': 'Jai Shri Krishna',
      'time': '5:30',
    },
    {
      'picture':
          'https://imgs.search.brave.com/FBdnptgDK7T5mB4Y6rn3aHcOs-aDLmguvXIA2OHKNSI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzE1LzMxLzM0LzE1/LzM2MF9GXzE1MzEz/NDE1NzBfcnJIdUh6/VXRobG9GbHk1SUto/OEI3cktiRG1MQWo5/bEIuanBn',
      'title': 'Om Namah Shivay',
      'time': '5:30',
    },
    {
      'picture':
          'https://imgs.search.brave.com/zqzXaNUr_YkLF9kEI9XgU981tbkctk-TuC_VCp7CMLg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA5Lzc1LzYzLzU5/LzM2MF9GXzk3NTYz/NTk5MF82TTdYOE93/QnVIdHhtWml0aTZS/cXk0Z2p5Qzh1TXFp/ZC5qcGc',
      'title': 'Durga Stotram',
      'time': '5:30',
    },
  ];

  int selectedIndex = 0;
  int selectindex1 = 0;

  List colorCardList = [
    Color.fromRGBO(242, 146, 27, 1), // orange
    Color.fromRGBO(243, 244, 246, 1), // grey
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: 401.61,
              height: 134.97,
              decoration: BoxDecoration(
                color: Color.fromRGBO(242, 146, 27, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50), 
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, 
                  children: [
                    SvgPicture.asset(
                      'assets/Vector.svg',
                      width: 30,
                      height: 20,
                      color: Colors.white,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Mantras',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.search, size: 25, color: Colors.white),
                    SizedBox(width: 10),
                    Icon(
                      Icons.favorite_border_outlined,
                      size: 23,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15),

            // category list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(namedList.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      alignment: Alignment.center,
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? colorCardList[0]
                            : colorCardList[1],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        namedList[index],
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  'All Mantras',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Text(
                  'View all',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(242, 146, 27, 0.1),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: songList.length,
                itemBuilder: (context, picindex) {
                  return Container(
                    height: 76.6,
                    margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    decoration: BoxDecoration(
                      color: selectindex1 == picindex
                          ? colorCardList[0]
                          : colorCardList[1],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          songList[picindex]['picture'],
                          width: 60,
                          height: 60,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      title: Text(
                        songList[picindex]['title'],
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        songList[picindex]['time'],
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      trailing: Icon(Icons.play_arrow, color: Colors.black),
                      onTap: () {
                        setState(() {
                          selectindex1 = picindex;
                        });

                        // bottom sheet
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(16),
                              height: 150, // 🔹 कमी केलेली height
                              child: Row(
                                children: [
                                  // LEFT SIDE - Small Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      songList[picindex]["picture"],
                                      height: 80, // 🔹 छोटं केलं
                                      width: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16),

                                  // RIGHT SIDE - Title + Controls
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          songList[picindex]["title"],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 12),

                                        // 🔹 Control Buttons Row
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.skip_previous,
                                                size: 32,
                                                color: Colors.grey[800],
                                              ),
                                              onPressed: () {
                                                // TODO: Handle previous song
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.play_circle_fill,
                                                size: 40,
                                                color: Color.fromRGBO(
                                                  242,
                                                  146,
                                                  27,
                                                  1,
                                                ),
                                              ),
                                              onPressed: () {
                                                // TODO: Handle play/pause
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.skip_next,
                                                size: 32,
                                                color: Colors.grey[800],
                                              ),
                                              onPressed: () {
                                                // TODO: Handle next song
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
