import 'package:pocketbase/pocketbase.dart';

class PocketBaseService {
  static final PocketBase pb = PocketBase(
    'http://10.0.2.2:8090',
  );
}