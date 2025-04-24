import 'package:hive/hive.dart';
import 'keys.dart';

class HiveHelp {
  // Initialize the box using the key from Keys
  static var box = Hive.box(Keys.hiveinit);

  // Read a value by key
  static dynamic read(String key) {
    return box.get(key);
  }

  // Write a value to a key
  static void write(String key, dynamic value) {
    box.put(key, value);
  }

  // Remove a specific key
  static void remove(String key) {
    box.delete(key);
  }

  // Clear all data in the box
  static void cleanall() {
    box.clear();
  }
}
