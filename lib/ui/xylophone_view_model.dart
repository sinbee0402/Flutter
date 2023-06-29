import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class XylophoneViewModel {
  Soundpool get _pool =>
      Soundpool.fromOptions(options: SoundpoolOptions.kDefault);

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  final List<int> _soundIds = [];
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
      final soundId = await rootBundle
          .load('assets/$soundFile')
          .then((soundData) => _pool.load(soundData));
      // final soundData = await rootBundle.load('assets/$soundFile');
      // final soundId = await _pool.load(soundData);

      _soundIds.add(soundId);
    }

    _isLoading = false;
  }

  void playSound(int soundId) {
    _pool.play(soundId);
  }

  void soundDo1() {
    playSound(_soundIds[0]);
  }

  void soundRe() {
    playSound(_soundIds[1]);
  }

  void soundMi() {
    playSound(_soundIds[2]);
  }

  void soundFa() {
    playSound(_soundIds[3]);
  }

  void soundSol() {
    playSound(_soundIds[4]);
  }

  void soundLa() {
    playSound(_soundIds[5]);
  }

  void soundSi() {
    playSound(_soundIds[6]);
  }

  void soundDo2() {
    playSound(_soundIds[7]);
  }

  void dispose() {
    _pool.dispose();
  }
}
