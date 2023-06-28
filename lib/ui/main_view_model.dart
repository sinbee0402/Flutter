import 'package:sensors_plus/sensors_plus.dart';
import 'package:tilt_sensor/model/sensor_model.dart';

class SensorViewModel {
  Stream<SensorModel> get eventStream => accelerometerEvents
      .map((event) => SensorModel(event.x, event.y, event.z));
}
