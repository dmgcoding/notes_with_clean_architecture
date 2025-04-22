import 'package:hive/hive.dart';

abstract class HiveStorageRepository {
  Future<void> init();
  Future<Box<T>> getBox<T>(String name);
  Future<void> deleteBox(String name);
}
