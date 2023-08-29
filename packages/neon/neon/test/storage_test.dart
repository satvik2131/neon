import 'package:neon/src/settings/models/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  test('AppStorage', () async {
    expect(() => AppStorage.reqireDatabase, throwsA(isA<StateError>()));

    SharedPreferences.setMockInitialValues({});
    await AppStorage.init();

    expect(AppStorage.reqireDatabase, isA<SharedPreferences>());
  });
}
