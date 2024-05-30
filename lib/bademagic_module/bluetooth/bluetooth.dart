import 'dart:async';

import 'package:badgemagic/bademagic_module/models/data.dart';
import 'package:badgemagic/bademagic_module/utils/DataToByteArrayConverter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

/// Writes the given [data] to the specified [characteristicId] on the [device].
Future<void> writeCharacteristic(BluetoothDevice device,Guid characteristicId,Data data,) async {
  List<List<int>> dataChunks = convert(data);
  debugPrint("Data to write: $dataChunks");
  try {
    List<BluetoothService> services = await device.discoverServices();
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        if (characteristic.properties.write) {
          for (List<int> chunk in dataChunks) {
            await characteristic.write(chunk,
                withoutResponse: false, timeout: 2, allowLongWrite: true);
          }
          debugPrint("Characteristic written successfully");
        }
      }
    }
  } catch (e) {
    debugPrint("Failed to write characteristic: $e");
  }
}

/// Scans for devices with the specified service and writes the [data] to the first found device with the target UUID.
Future<void> scanAndConnect(Data data, String targetUuid) async {
  ScanResult? foundDevice;
  StreamSubscription<List<ScanResult>>? subscription;
  try {
    subscription = FlutterBluePlus.scanResults.listen(
      (results) async {
        for (ScanResult result in results) {
          if (result.advertisementData.serviceUuids.contains(Guid("0000fee0-0000-1000-8000-00805f9b34fb"))) {
            foundDevice = result;
            break;
          }
        }
        if (foundDevice != null) {
          await connectToDevice(foundDevice!, data);
        } else {
          debugPrint("Target device not found");
        }
      },
      onError: (e) {
        debugPrint("Scan error: $e");
      },
    );

    await FlutterBluePlus.startScan(
      withServices: [Guid("0000fee0-0000-1000-8000-00805f9b34fb")],
      timeout: Duration(seconds: 10),
    );

    // Wait for the scan to complete before cancelling the subscription
    await Future.delayed(Duration(seconds: 11));
  } finally {
    await subscription?.cancel();
  }
}

/// Connects to the given [scanResult] device and writes the [data] to it.
Future<void> connectToDevice(ScanResult scanResult, Data data) async {
  try {
    await scanResult.device.connect(autoConnect: false);
    BluetoothConnectionState connectionState = await scanResult.device.connectionState.first;

    if (connectionState == BluetoothConnectionState.connected) {
      debugPrint("Device connected");
      await writeCharacteristic(scanResult.device, Guid("0000fee1-0000-1000-8000-00805f9b34fb"), data);
    } else {
      debugPrint("Failed to connect to the device");
    }
  } catch (e) {
    debugPrint("Connection error: $e");
  } finally {
    await scanResult.device.disconnect();
  }
}
