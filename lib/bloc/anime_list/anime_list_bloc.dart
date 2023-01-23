import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/anime_model.dart';
import '../../services/service.dart';
import '../../services/status_enum.dart';
part 'anime_list_event.dart';
part 'anime_list_state.dart';

class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  AnimeListBloc() : super(AnimeListState.initial()) {
    on<GetAnimeListEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await Service().getAnimeList();
        emit(
          state.copyWith(
            status: Status.success,
            animeList: response.data,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: Status.error,
            errorMessage: "Terjadi Kesalahan",
          ),
        );
      }
    });
  }
}
