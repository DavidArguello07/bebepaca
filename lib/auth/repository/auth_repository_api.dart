import 'package:bebepaca/auth/models/admin_user_model.dart';
import 'package:bebepaca/auth/models/user_role.dart';
import 'package:bebepaca/utils/handle_auth_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryAPI {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> loginWithEmail(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return '200';
    } on FirebaseAuthException catch (e) {
      return HandlerAuthErrors.getError(e.code);
    } catch (e) {
      return 'Ocurrio un error al iniciar sesión';
    }
  }

  Future<String> registerWithEmail(String email, String password, String name) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
      await user.user!.updateDisplayName(name);
      await saveUser(email, user.user!.uid, name);
      return '200';
    } on FirebaseAuthException catch (e) {
      return HandlerAuthErrors.getError(e.code);
    } catch (e) {
      return 'Ocurrio un error al registrarte';
    }
  }

  Future<void> saveUser(String email, String uid, String name) {
    return firestore.collection('users').doc(uid).set({
      'createdAt': FieldValue.serverTimestamp(),
      'uid': uid,
      'active': false,
      'approved': false,
      'role': userRoleToString(UserRole.none),
      'name': name,
      'email': email,
    });
  }

  Stream<User?> authStateChanges() => auth.authStateChanges();

  Stream<AdminUserModel> get getCurrentUserAdmin$ {
    try {
      return firestore.collection('usersAdmin').doc(auth.currentUser!.uid).snapshots().map((doc) {
        return AdminUserModel.fromJson(doc.data() as Map<String, dynamic>);
      });
    } catch (e) {
      return Stream.value(AdminUserModel(uid: ''));
    }
  }

  Future<void> logout() {
    return auth.signOut();
  }
}
