import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/local/anime_entity.dart';
import '../../shared/app_database.dart';
part 'favorite_anime_list_event.dart';
part 'favorite_anime_list_state.dart';

class FavoriteAnimeListBloc
    extends Bloc<FavoriteAnimeListEvent, FavoriteAnimeListState> {
  FavoriteAnimeListBloc() : super(FavoriteAnimeListInitial()) {
    on<GetFavoriteAnime>((event, emit) async {
      try {
        final database =
            await $FloorAppDatabase.databaseBuilder('app_database.db').build();
        final animeDao = database.animeDao;
        final result = await animeDao.getListFavorite();

        emit(FavoriteAnimeListSucess(favoriteAnimeList: result));
      } catch (e) {
        emit(const FavoriteAnimeListError(errorMessage: "Terjadi kesalahan"));
      }
    });
  }
}
