import 'package:hive/hive.dart';

class StoreBoxActions {
  String userResponseBox = 'userResponse';

  openBox() async {
    await Hive.openBox(StoreBoxActions().userResponseBox);
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
