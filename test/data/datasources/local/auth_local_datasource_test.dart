import 'package:flutter_pos/core/services/database/database_service.dart';
import 'package:flutter_pos/data/datasources/local/auth_local_datasource_impl.dart';
import 'package:flutter_pos/data/datasources/local/user_local_datasource_impl.dart';
import 'package:flutter_pos/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Database testDatabase;
  late UserLocalDatasourceImpl users;

  setUpAll(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    testDatabase = await openDatabase(inMemoryDatabasePath);
    await DatabaseService.instance.initTestDatabase(testDatabase: testDatabase);
    users = UserLocalDatasourceImpl(DatabaseService.instance);
  });

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('local sign-in saves the session and the user record', () async {
    final prefs = await SharedPreferences.getInstance();
    final auth = AuthLocalDatasourceImpl(prefs);

    final signedIn = await auth.signIn(email: 'Ada@Local.test', name: 'Ada');

    expect(signedIn.isSuccess, isTrue);
    expect(signedIn.data?.id, 'ada@local.test');
    expect(signedIn.data?.name, 'Ada');

    final created = await users.createUser(UserModel.fromEntity(signedIn.data!.toEntity()));
    expect(created.isSuccess, isTrue);

    final current = await auth.getCurrentUser();
    final stored = await users.getUser('ada@local.test');

    expect(current.data?.email, 'Ada@Local.test');
    expect(stored.data?.name, 'Ada');

    await auth.signOut();
    expect((await auth.getCurrentUser()).data, isNull);
  });

  test('sign-in with only a name still creates a session', () async {
    final prefs = await SharedPreferences.getInstance();
    final auth = AuthLocalDatasourceImpl(prefs);

    final signedIn = await auth.signIn(email: '  ', name: 'Guest User');

    expect(signedIn.isSuccess, isTrue);
    expect(signedIn.data?.id.startsWith('guest_'), isTrue);
    expect(signedIn.data?.name, 'Guest User');
    expect((await auth.getCurrentUser()).data?.name, 'Guest User');
  });
}
