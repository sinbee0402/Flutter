import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class XylophoneViewModel {
  Soundpool get pool =>
      Soundpool.fromOptions(options: SoundpoolOptions.kDefault);

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<int> soundIds = [];
  List<String> sounds = [
    'do1.wav',
    're.wav',
    'mi.wav',
    'fa.wav',
    'sol.wav',
    'la.wav',
    'si.wav',
    'do2.wav'
  ];

  Future<void> initSoundPool() async {
    for (String soundFile in sounds) {
      int soundId = await rootBundle
          .load(soundFile)
          .then((soundData) => pool.load(soundData));

      soundIds.add(soundId);
    }

    _isLoading = false;
  }

  void playSound(int num) {
    pool.play(num);
  }

  // Future<int> sound(int num) async {
  //   await initSoundPool(sounds[num]);
  //   return soundIds[num];
  // }
}
