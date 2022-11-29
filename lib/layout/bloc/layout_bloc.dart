import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_event.dart';
part 'layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  LayoutBloc() : super(const LayoutInitial()) {
    on<OnChangeLoading>(
        (event, emit) => emit(state.copyWith(loading: event.isLoading)));
    on<OnChangeDialogOpen>(
        (event, emit) => emit(state.copyWith(dialogOpen: event.dialogOpen)));
  }

  setLoading(bool loading) {
    add(OnChangeLoading(isLoading: loading));
  }

  setDialogOpen(bool dialogOpen) {
    add(OnChangeDialogOpen(dialogOpen: dialogOpen));
  }
}
