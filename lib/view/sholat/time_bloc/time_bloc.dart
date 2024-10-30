import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_alquran/api/sholat_api.dart';
import 'package:my_alquran/models/sholat/get_time_models.dart';

part 'time_event.dart';
part 'time_state.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  TimeBloc() : super(TimeInitial()) {
    on<TimeEvent>((event, emit) async {
      try {
        final response = await SholatApi().getTimeApi();
        emit(TimeLoaded(response.data));
      } catch (e) {
        emit(TimeError(e.toString()));
      }
    });
  }
}
