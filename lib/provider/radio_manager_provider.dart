import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioManagerProvider extends ChangeNotifier {
  AudioPlayer player = AudioPlayer();
  String? currentUrl;
  bool isPlay = false;
  double currentVolume = 2;
  // play
  Future<void> setPlaying(String url) async {
    if (currentUrl == url) {
      isPlay ? await player.pause() : await player.resume();
      isPlay = !isPlay;
    } else {
      currentUrl = url;
      await player.play(UrlSource(url));
      isPlay = true;
    }
    notifyListeners();
  }

  // stop
  Future<void> setStop() async {
    await player.stop();
    currentUrl = null;
    isPlay = false;
    notifyListeners();
  }

  // volume

  Future<void> setVolum(double volume) async {
    currentVolume = volume;
    await player.setVolume(currentVolume);
    notifyListeners();
  }
}
