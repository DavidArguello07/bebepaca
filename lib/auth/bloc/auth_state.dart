// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AdminUserModel adminUser;

  const AuthState({required this.adminUser});

  @override
  List<Object> get props => [adminUser];

  AuthState copyWith({
    AdminUserModel? adminUser,
  }) {
    return AuthState(
      adminUser: adminUser ?? this.adminUser,
    );
  }
}

class AuthInitial extends AuthState {
  AuthInitial() : super(adminUser: AdminUserModel(uid: ''));
}
