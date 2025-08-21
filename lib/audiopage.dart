import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class InAudiopage extends StatefulWidget {
  const InAudiopage({super.key});

  @override
  State<InAudiopage> createState() => _InAudiopageState();
}

class _InAudiopageState extends State<InAudiopage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool isPlaying = false;

  // Dummy list
  List<Map<String, String>> songList = [
    {
      "title": "Ganesh Aarti",
      "time": "04:35",
      "picture": "https://via.placeholder.com/150",
    },
    {
      "title": "Shiv Mantra",
      "time": "05:20",
      "picture": "https://via.placeholder.com/150",
    },
  ];
  int selectindex1 = -1;
  List<Color> colorCardList = [Colors.orange.shade100, Colors.grey.shade200];

  @override
  void initState() {
    super.initState();

    _audioPlayer.onDurationChanged.listen((d) {
      setState(() => _duration = d);
    });

    _audioPlayer.onPositionChanged.listen((p) {
      setState(() => _position = p);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Bar
          Container(
            width: double.infinity,
            height: 134.97,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(242, 146, 27, 1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/Vector.svg',
                    width: 30,
                    height: 20,
                    color: Colors.white,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Mantras',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.search, size: 25, color: Colors.white),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.favorite_border_outlined,
                    size: 23,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Image.asset('assets/ganapati.png'),
          const SizedBox(height: 10),
          Text(
            'Ganesh Aarti',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),

          // Slider with duration
          Slider(
            value: _position.inSeconds.toDouble(),
            min: 0,
            max: _duration.inSeconds.toDouble() > 0
                ? _duration.inSeconds.toDouble()
                : 1,
            onChanged: (value) async {
              final pos = Duration(seconds: value.toInt());
              await _audioPlayer.seek(pos);
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(_position)),
                Text(formatTime(_duration)),
              ],
            ),
          ),

          // Controls Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.shuffle, size: 25),
                  onPressed: () {
                    // TODO: shuffle logic
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous, size: 35),
                      onPressed: () {
                        // TODO: previous logic
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 50,
                      ),
                      onPressed: () async {
                        if (isPlaying) {
                          await _audioPlayer.pause();
                        } else {
                          await _audioPlayer.play(AssetSource('ganesh.mp3'));
                        }
                        setState(() => isPlaying = !isPlaying);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next, size: 35),
                      onPressed: () {
                        // TODO: next logic
                      },
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.repeat, size: 25),
                  onPressed: () {
                    // TODO: repeat logic
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Up next',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'See all',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(242, 146, 27, 1),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),

          // Song List
          Expanded(
            child: ListView.builder(
              itemCount: songList.length,
              itemBuilder: (context, picindex) {
                return Container(
                  height: 76.6,
                  margin: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 10,
                  ),
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
                        songList[picindex]['picture']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      songList[picindex]['title']!,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      songList[picindex]['time']!,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    trailing: const Icon(Icons.play_arrow, color: Colors.black),
                    onTap: () async {
                      setState(() {
                        selectindex1 = picindex;
                      });
                      await _audioPlayer.play(AssetSource('ganesh.mp3'));
                      setState(() => isPlaying = true);
                    },
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
