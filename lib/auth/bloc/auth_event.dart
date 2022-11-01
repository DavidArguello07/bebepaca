part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class OnChangeAdminUser extends AuthEvent {
  final AdminUserModel adminUser;

  OnChangeAdminUser({required this.adminUser});

  @override
  List<Object?> get props => [adminUser];
}
