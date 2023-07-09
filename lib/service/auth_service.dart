import 'package:firebase_auth/firebase_auth.dart';
import 'package:spike_monster/model/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthApi {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<User?> get currentUser async {
    return _auth.currentUser;
  }

  Future<void> createAnAccountWithEmail(
      {required email, required String password, required String name}) async {
    if (password.length <= 6) {
      throw Exception('Register fail, password length most greater than 6');
    }
    _auth.createUserWithEmailAndPassword(email: email, password: password);
    _fireStore.collection('users').add({});
  }

  Future<void> loginWithEmail({required email, required password}) async {
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateUserAccount() async {}

  Future<Account> get accountDetail async {
    Account account = Account(name: 'name', email: 'email', id: '');
    return account;
  }

  Future<String> _generateUserId() async {
    var userCounts = await _fireStore.collection('/user_count').get();
    int userCount = userCounts.docs.first.get('total_users');
    userCount++;
    // SXTthuGydN3Z2XfL0OBg is the ID of user_count in firebase
    // TODO: find the method to refactor this hard code.
    await _fireStore
        .collection('/user_count')
        .doc('SXTthuGydN3Z2XfL0OBg')
        .update({
      'total_users': userCount,
    });
    return userCount.toString().padLeft(6, '0');
  }
}
