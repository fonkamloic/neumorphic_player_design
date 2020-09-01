import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui_music_player/album_art.dart';
import 'package:ui_music_player/colors.dart';
import 'package:ui_music_player/navbar.dart';
import 'package:ui_music_player/player_controls.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Circular',
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> sliderState = useState(2);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavigationBar(),
          Container(
            height: size.height / 2.5,
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return AlbumArt();
                },
                itemCount: 3,
                scrollDirection: Axis.horizontal),
          ),
          Text(
            'Gidget',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: darkPrimaryColor),
          ),
          Text(
            'The three Nationals',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: darkPrimaryColor),
          ),
          SliderTheme(
            data: SliderThemeData(
                trackHeight: 5,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
            child: Slider(
              activeColor: darkPrimaryColor,
              inactiveColor: darkPrimaryColor.withOpacity(0.3),
              value: sliderState.value,
              onChanged: (value) {
                sliderState.value = value;
              },
              min: 0,
              max: 20,
            ),
          ),
          PlayerControls(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
