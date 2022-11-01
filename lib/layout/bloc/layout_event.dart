part of 'layout_bloc.dart';

abstract class LayoutEvent extends Equatable {}

class OnChangeLoading extends LayoutEvent {
  final bool isLoading;

  OnChangeLoading({required this.isLoading});
  @override
  List<Object?> get props => [isLoading];
}

class OnChangeDialogOpen extends LayoutEvent {
  final bool dialogOpen;

  OnChangeDialogOpen({required this.dialogOpen});
  @override
  List<Object?> get props => [dialogOpen];

}
