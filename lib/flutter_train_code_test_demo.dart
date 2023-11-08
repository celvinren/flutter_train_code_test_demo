void main() {
  // Example usage
  printTrain("p4 p6 h10+");
}

void printTrain(String config) {
  try {
    // Split the configuration and start with the locomotive
    final parts = config.split(' ');
    final trainList = <Car>[Locomotive()];

    // Parse the configuration and add cars
    for (final part in parts) {
      final type = part[0];
      final info = part.substring(1);

      switch (type) {
        case 'p':
          final windows = int.tryParse(info);
          if (windows == null) {
            throw Exception('Invalid passenger car configuration.');
          }
          trainList.add(PassengerCar(windows));
          break;
        case 'h':
          final length = int.tryParse(info.substring(0, info.length - 1));
          final mineral = info[info.length - 1];
          if (length == null) {
            throw Exception('Invalid hopper car configuration.');
          }
          trainList.add(HopperCar(length, mineral));
          break;
      }
    }
    final train = trainList.joinAllCars();
    train.printTrain();
  } catch (e) {
    print(e.toString());
  }
}

extension on List<Car> {
  Car joinAllCars() {
    return reduce((value, element) => join(value, element));
  }

  Car join(Car originalCar, Car joinCar2) {
    return Car(
      '${originalCar.line1} ${joinCar2.line1}',
      '${originalCar.line2} ${joinCar2.line2}',
      '${originalCar.line3} ${joinCar2.line3}',
      '${originalCar.line4}-${joinCar2.line4}',
      '${originalCar.line5} ${joinCar2.line5}',
    );
  }
}

class Car {
  String line1;
  String line2;
  String line3;
  String line4;
  String line5;
  Car(this.line1, this.line2, this.line3, this.line4, this.line5);

  printTrain() {
    print(line1);
    print(line2);
    print(line3);
    print('$line4-1');
    print(line5);
  }
}

class Locomotive extends Car {
  Locomotive()
      : super(
          "     o o ",
          "   o  ___",
          " _][__|o|",
          "(_______|",
          "/O-O-O-O ",
        );
}

class Hub extends Car {
  Hub(super.line1, super.line2, super.line3, super.line4, super.line5) {
    assert(line4.length >= 7, 'Invalid car wheel configuration.');
    if (line4.length < 7) {
      throw Exception('Invalid car wheel configuration.');
    }
  }
}

class PassengerCar extends Hub {
  PassengerCar(int windows)
      : super(
          "",
          "__${'_' * (windows * 2)}_",
          "| ${'O ' * windows}|",
          "|_${'_' * (windows * 2)}|",
          " oo ${' ' * (windows * 2 - 4)}oo ",
        );
}

class HopperCar extends Hub {
  HopperCar(int length, String mineral)
      : super(
          "",
          "",
          "|${mineral * length}|",
          "|${'_' * length}|",
          " oo${' ' * (length - 4)}oo ",
        );
}
