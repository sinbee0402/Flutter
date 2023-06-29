// StatefulWidget으로 해야하는지, StatelessWidget으로 해야하는지 판단이 서지 않는다면,
// StatelessWidget으로 시작하면 된다.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xylophone/ui/xylophone_view_model.dart';

class XylophoneScreen extends StatefulWidget {
  const XylophoneScreen({Key? key}) : super(key: key);

  @override
  State<XylophoneScreen> createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  final viewModel = XylophoneViewModel();

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('실로폰'),
      ),
      body: FutureBuilder<void>(
          future: viewModel.initSoundPool(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // 에러 발생
              // Unable to load asset: "assets/re.wav".
              // The asset does not exist or has empty data.
              return const Center(child: Text('알 수 없는 에러'));
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: gunban(
                      '도',
                      Colors.red,
                      onPress: () => viewModel.soundDo1(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: gunban(
                      '레',
                      Colors.orange,
                      onPress: () => viewModel.soundRe(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: gunban(
                      '미',
                      Colors.yellow,
                      onPress: () => viewModel.soundMi(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: gunban(
                      '파',
                      Colors.lightGreen,
                      onPress: () => viewModel.soundFa(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48.0),
                    child: gunban(
                      '솔',
                      Colors.green,
                      onPress: () => viewModel.soundSol(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 56.0),
                    child: gunban(
                      '라',
                      Colors.blue,
                      onPress: () => viewModel.soundLa(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 64.0),
                    child: gunban(
                      '시',
                      Colors.deepPurpleAccent,
                      onPress: () => viewModel.soundSi(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 72.0),
                    child: gunban(
                      '도',
                      Colors.purple,
                      onPress: () => viewModel.soundDo2(),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }

  Widget gunban(String text, Color color, {Function()? onPress}) {
    return GestureDetector(
      onTap: () {
        //viewModel.pool.play(soundId);
        //viewModel.playSound(soundId);
        onPress?.call();
      },
      child: Container(
        width: 50,
        height: double.infinity,
        color: color,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
