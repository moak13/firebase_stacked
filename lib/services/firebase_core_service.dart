import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_stacked/firebase_options.dart';

class FirebaseCoreService {
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
