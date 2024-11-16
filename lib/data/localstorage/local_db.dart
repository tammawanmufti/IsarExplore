import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';

abstract class LocalDB {
  LocalDB({
    required this.collectionSchemas,
  }) {
    init();
  }

  Isar? instance;
  final List<CollectionSchema> collectionSchemas;

  Future<void> init() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      instance = Isar.openSync(
        collectionSchemas,
        directory: dir.path,
        inspector: true,
      );
    } catch (e) {
      print(e);
    }
  }

  Isar call() {
    if (instance == null || !instance!.isOpen) {
      init();
    }
    return instance!;
  }
}
