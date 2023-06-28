// StatefulWidget으로 해야하는지, StatelessWidget으로 해야하는지 판단이 서지 않는다면,
// StatelessWidget으로 시작하면 된다.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xylophone/ui/xylophone_view_model.dart';

class XylophoneScreen extends StatefulWidget {
  XylophoneScreen({Key? key}) : super(key: key);

  @override
  State<XylophoneScreen> createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  final viewModel = XylophoneViewModel();

  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => viewModel.initSoundPool().then((value) => setState(() {})));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('실로폰'),
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: gunban('도', Colors.red, viewModel.soundIds[0]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: gunban('레', Colors.orange, viewModel.soundIds[1]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: gunban('미', Colors.yellow, viewModel.soundIds[2]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: gunban('파', Colors.lightGreen, viewModel.soundIds[3]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48.0),
                  child: gunban('솔', Colors.green, viewModel.soundIds[4]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 56.0),
                  child: gunban('라', Colors.blue, viewModel.soundIds[5]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64.0),
                  child: gunban(
                      '시', Colors.deepPurpleAccent, viewModel.soundIds[6]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 72.0),
                  child: gunban('도', Colors.purple, viewModel.soundIds[7]),
                ),
              ],
            ),
    );
  }

  Widget gunban(String text, Color color, int soundId) {
    return GestureDetector(
      onTap: () {
        //viewModel.pool.play(soundId);
        viewModel.playSound(soundId);
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
