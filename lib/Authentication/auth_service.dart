import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class auth_service{
  final SupabaseClient _supabase = Supabase.instance.client;


  // Sign In with Email and Password
  Future<AuthResponse> signInWithEmailAndPassword(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
        email: email,
        password: password
    );
  }

  // Sign Up with Email and Password
  Future<AuthResponse> signUpwithEmailAndPassword(String email, String password) async {
    return await _supabase.auth.signUp(
        email: email,
        password: password
    );

  }

  // Sign Out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  // Get User Email
  String? getUserEmail() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }

  // Google SignIn

  // static Future<AuthResponse> googleSignIn() async {
  //   /// TODO: update the Web client ID with your own.
  //   ///
  //   /// Web Client ID that you registered with Google Cloud.
  //   const webClientId = '802904420115-do95lk2vpmgicrcd46rmimrtksis67jk.apps.googleusercontent.com';
  //
  //   /// TODO: update the iOS client ID with your own.
  //   ///
  //   /// iOS Client ID that you registered with Google Cloud.
  //
  //   // Google sign in on Android will work without providing the Android
  //   // Client ID registered on Google Cloud.
  //
  //   final GoogleSignIn googleSignIn = GoogleSignIn(
  //     serverClientId: webClientId,
  //   );
  //   final googleUser = await googleSignIn.signIn();
  //   final googleAuth = await googleUser!.authentication;
  //   final accessToken = googleAuth.accessToken;
  //   final idToken = googleAuth.idToken;
  //
  //   if (accessToken == null) {
  //     throw 'No Access Token found.';
  //   }
  //   if (idToken == null) {
  //     throw 'No ID Token found.';
  //   }
  //
  //   return Supabase.instance.client.auth.signInWithIdToken(
  //     provider: OAuthProvider.google,
  //     idToken: idToken,
  //     accessToken: accessToken,
  //   );
  // }

}

