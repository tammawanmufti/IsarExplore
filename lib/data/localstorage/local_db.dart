import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';

abstract class LocalDB {
  LocalDB({
    required this.collectionSchemas,
    required this.name,
  });

  late final Isar instance;
  final List<CollectionSchema> collectionSchemas;
  final String name;

  static Lock lock = Lock();

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    instance = await Isar.open(
      collectionSchemas,
      name: name,
      directory: dir.path,
      inspector: true,
    );
  }

  Isar call() {
    return instance;
  }
}
