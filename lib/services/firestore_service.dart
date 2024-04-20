import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_stacked/app/app.logger.dart';

class FirestoreService {
  final _logger = getLogger('FirestoreService');
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> post({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      final reference = _firebaseFirestore.doc(path);
      await reference.set(data);
    } catch (e, s) {
      await _handleError(e, s);
    }
  }

  Future<T?> get<T>({
    required String path,
    required T Function(Map<String, dynamic> data) builder,
  }) async {
    try {
      final reference = _firebaseFirestore.doc(path);
      final snapshot = await reference.get();
      final data = snapshot.data();
      return builder(data!);
    } catch (e, s) {
      await _handleError(e, s);
      return null;
    }
  }

  Future<void> delete({
    required String path,
  }) async {
    try {
      final reference = _firebaseFirestore.doc(path);
      await reference.delete();
    } catch (e, s) {
      await _handleError(e, s);
    }
  }

  Future<void> patch({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      final reference = _firebaseFirestore.doc(path);
      await reference.update(data);
    } catch (e, s) {
      await _handleError(e, s);
    }
  }

  Future<void> _handleError(dynamic e, StackTrace s) async {
    _logger.e('Operation failed with this error and stacktrace', e, s);
    throw e;
  }
}
