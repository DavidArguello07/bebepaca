// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'layout_bloc.dart';

class LayoutState extends Equatable {
  final bool loading;
  final bool dialogOpen;

  const LayoutState({required this.loading, required this.dialogOpen});
  @override
  List<Object> get props => [loading];

  LayoutState copyWith({
    bool? loading,
    bool? dialogOpen
  }) {
    return LayoutState(
      loading: loading ?? this.loading,
      dialogOpen: dialogOpen ?? this.dialogOpen
    );
  }
}

class LayoutInitial extends LayoutState {
  const LayoutInitial() : super(loading: false, dialogOpen: false);
}
