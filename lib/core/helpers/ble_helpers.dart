import 'dart:async';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BLEHelpers {
  final FlutterReactiveBle _ble = FlutterReactiveBle();

  late DiscoveredDevice? _connectedDevice;
  StreamSubscription<ConnectionStateUpdate>? _connection;

  // change this
  // final Uuid serviceUuid = Uuid.parse("your-service-uuid");
  // final Uuid characteristicUuid = Uuid.parse("your-characteristic-uuid");

  Stream<DiscoveredDevice> scanForDevices() {
    return _ble.scanForDevices(withServices: []);
  }

  // Future<void> discoverServices(String deviceId) async {
  //   final services = await _ble.discoverAllServices(deviceId);
  //   // for (final service in services) {
  //   //   print('Service UUID: ${service.serviceId}');
  //   //   for (final characteristic in service.characteristics) {
  //   //     print('Characteristic UUID: ${characteristic.characteristicId}');
  //   //   }
  //   // }
  // }

  Future<void> connectToDevice(DiscoveredDevice device) async {
    final connection = _ble.connectToDevice(
      id: device.id,
      connectionTimeout: const Duration(seconds: 5),
    );

    await for (final state in connection) {
      if (state.connectionState == DeviceConnectionState.connected) {
        _connectedDevice = device;
        break;
      }
    }
  }

  Future<void> disconnectDevice() async {
    await _connection?.cancel();
    _connectedDevice = null;
  }

  Stream<List<int>> listenToCharacteristic() {
    if (_connectedDevice == null) {
      throw Exception("No device connected");
    }

    return _ble.subscribeToCharacteristic(
      QualifiedCharacteristic(
        characteristicId: _connectedDevice!.serviceUuids.first,
        serviceId: _connectedDevice!.serviceUuids.first,
        deviceId: _connectedDevice!.id,
      ),
    );
  }

  Future<void> writeCharacteristic(List<int> data) async {
    if (_connectedDevice == null) {
      throw Exception("No device connected");
    }

    await _ble.writeCharacteristicWithResponse(
      QualifiedCharacteristic(
        characteristicId: _connectedDevice!.serviceUuids.first,
        serviceId: _connectedDevice!.serviceUuids.first,
        deviceId: _connectedDevice!.id,
      ),
      value: data,
    );
  }
}
