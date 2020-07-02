import 'package:meple/models/current_user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthenticationRepository {
  Future<void> signOut();
  Future<bool>  isSignedIn();
  Future<CurrentUser> getCurrentUser();
  
}

class FireBaseAuthenticationRepository extends AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final CollectionReference usersCollection = Firestore.instance.collection("users");

  FireBaseAuthenticationRepository({
    FirebaseAuth firebaseAuth, 
    GoogleSignIn googleSignIn,
  }) :
  _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
  _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  Future<CurrentUser> getCurrentUser() async {
    final currentUser = await _firebaseAuth.currentUser();
    return CurrentUser(
      uid: currentUser.uid ?? "",
      email: currentUser.email ?? "xxx@yyy.zzz",
      createdAt: currentUser.metadata.creationTime,
      updatedAt: currentUser.metadata.lastSignInTime,
    );
  }


  @override
  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  @override
  Future<void> signOut() {
    return Future.wait([ _firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

}