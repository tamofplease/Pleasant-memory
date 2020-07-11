import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SignInRepository {
  Future<void> signInWithGoogle();
  Future<void> signInAnonymously();
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> createUser(String email, String uid);
}

class FirebaseSignInRepository extends SignInRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final CollectionReference usersCollection = Firestore.instance.collection("users");

  FirebaseSignInRepository(
    {FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
    _googleSignIn = googleSignIn ?? GoogleSignIn();

  
  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> signInAnonymously() async {
    await _firebaseAuth.signInAnonymously();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await createUser(email, result.user.uid);
  }


  @override
  Future<void> createUser(String email, String uid) async {
    await usersCollection.document(uid).setData({
      'uid': uid ?? "",
      'name': "NoName",
      'email': email ?? "xxx@yyy.zzz",
      'photoUrl': "assets/images/default.png",
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
    });
  }

}


