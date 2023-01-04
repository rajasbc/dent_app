import 'package:hive/hive.dart';

class StoreBoxActions {
  String userResponseBox = 'userResponse';
  String addMedicineBox = 'addMedicine';

  openBox() async {
    await Hive.openBox(StoreBoxActions().userResponseBox);
    await Hive.openBox(StoreBoxActions().addMedicineBox);
  }

  clearBoxKey(keyname) async {
    await Hive.box(userResponseBox).delete(keyname);
  }

  clearEntireBox() async {
    if (await Hive.boxExists('userResponse')) {
      Hive.box(userResponseBox).clear();
    }
  }
}
