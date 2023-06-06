import 'dart:io';

import 'package:conduit_core/conduit_core.dart';
import 'package:conduit_postgresql/conduit_postgresql.dart';

class AppService extends ApplicationChannel {
  late final ManagedContext managedContext;

  @override
  Future prepare() {
    final persistentStore = _initDatabase();
    managedContext = ManagedContext(
        ManagedDataModel.fromCurrentMirrorSystem(), persistentStore);
    return super.prepare();
  }

  @override
  Controller get entryPoint => Router();

  PostgreSQLPersistentStore _initDatabase() {
    final username = Platform.environment["DB_USERNAME"] ?? "admin";
    final password = Platform.environment["DB_PASSWORD"] ?? "root";
    final host = Platform.environment["DB_HOST"] ?? "127.0.0.1";
    final port = int.parse(Platform.environment["DB_PORT"] ?? "5432");
    final databaseName = Platform.environment["DB_NAME"] ?? "postgres";
    return PostgreSQLPersistentStore(
      username,
      password,
      host,
      port,
      databaseName,
    );
  }
}

//prepare - подготовить
//ManagedDataModel - управляемая модель данных
//fromCurrentMirrorSystem - из текущей зекральной системы
//PersistentStore - постоянное хранилище
//parse - разбор

