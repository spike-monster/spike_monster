import 'package:firebase_auth/firebase_auth.dart';
import 'package:spike_monster/model/account.dart';

class AuthApi {
  final _auth = FirebaseAuth.instance;

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
    Account account = Account(name: 'name', email: 'email', id: 0);
    return account;
  }
}
