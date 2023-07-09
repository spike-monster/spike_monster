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

  Future<String> generateUserId() async {
    var userCounts = await _fireStore.collection('/user_count').get();
    int userCount = userCounts.docs.first.get('user_count');
    userCount++;
    await _fireStore.collection('/user_count').doc().update({
      'user_count': 10,
    });
    return userCount.toString().padLeft(6, '0');
  }
}
