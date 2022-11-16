import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class IHelpFirebaseUser {
  IHelpFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

IHelpFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<IHelpFirebaseUser> iHelpFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<IHelpFirebaseUser>(
      (user) {
        currentUser = IHelpFirebaseUser(user);
        return currentUser!;
      },
    );
