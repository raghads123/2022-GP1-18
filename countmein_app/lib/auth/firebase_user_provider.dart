import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CountMeInFirebaseUser {
  CountMeInFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CountMeInFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CountMeInFirebaseUser> countMeInFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CountMeInFirebaseUser>(
      (user) {
        currentUser = CountMeInFirebaseUser(user);
        return currentUser!;
      },
    );
