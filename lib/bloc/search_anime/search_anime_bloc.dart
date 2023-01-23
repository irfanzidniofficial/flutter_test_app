import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/anime_model.dart';
import '../../services/service.dart';
import '../../services/status_enum.dart';
part 'search_anime_event.dart';
part 'search_anime_state.dart';

class SearchAnimeBloc extends Bloc<SearchAnimeEvent, SearchAnimeState> {
  SearchAnimeBloc() : super(SearchAnimeState.initial()) {
    on<SearchAnime>((event, emit) async {
      emit(state.copyWith(status: Status.loading));

      try {
        final response = await Service().searchAnime(event.keyword);

        emit(state.copyWith(status: Status.success, animeList: response.data));
      } catch (e) {
        emit(
          state.copyWith(
              status: Status.error, errorMessage: "Terjadi Kesalahan"),
        );
      }
    });
  }
}
