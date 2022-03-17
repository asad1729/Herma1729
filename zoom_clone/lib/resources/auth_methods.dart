import "package:google_sign_in/google_sign_in.dart";

class Auth_Methods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;

  Future <bool> sign_in_with_google(BuildContext context) async {
    bool counter = false;
    try {
      final GoogleSignInAccount? google_user = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await google_user?.authentication;
      final credential  = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCredential =  await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if(user!=null){
        if(_auth.additionalUserInfo!.isNewUser){
          await firestore.collection('users').doc(user.uid).set({
            'username':user.displayName,
            'profile_picture':user.photoUrl,
            'uid': user.uid, 
            'email':user.email,
            'bio':'',
            'timestamp':DateTime.now()
          });
          })
        }
        counter=true;
      }
    } on FirebaseAuthException catch (e) {
      show_snack_bar(context, e.message!)
      counter=false;
    }
  }
}
