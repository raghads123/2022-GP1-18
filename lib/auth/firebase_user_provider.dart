import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GradProject2FirebaseUser {
  GradProject2FirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

GradProject2FirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GradProject2FirebaseUser> gradProject2FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<GradProject2FirebaseUser>(
      (user) {
        currentUser = GradProject2FirebaseUser(user);
        return currentUser!;
      },
    );
