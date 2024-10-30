import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_alquran/api/asmaulhusna_api.dart';
import 'package:my_alquran/models/asmaulhusna/asmaulhusna_models.dart';

part 'asmaulhusna_event.dart';
part 'asmaulhusna_state.dart';

class AsmaulhusnaBloc extends Bloc<AsmaulhusnaEvent, AsmaulhusnaState> {
  AsmaulhusnaBloc() : super(AsmaulhusnaInitial()) {
    on<AsmaulhusnaEvent>((event, emit) async {
      try {
        final response = await AsmaulhusnaApi().getAsmaulHusna();
        emit(AsmaulhusnaLoaded(response.data));
      } catch (e) {
        emit(AsmaulhusnaError(e.toString()));
      }
    });
  }
}
