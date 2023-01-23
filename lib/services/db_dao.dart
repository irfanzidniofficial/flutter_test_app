import 'package:floor/floor.dart';

import '../model/local/anime_entity.dart';

@dao
abstract class AnimeDao {
  @Query("SELECT * FROM AnimeEntity")
  Future<List<AnimeEntity>> getListFavorite();

  @insert
  Future<int> addToFavorite(AnimeEntity animeEntity);

  @delete
  Future<int> removeFromFavorite(AnimeEntity animeEntity);

  @Query("SELECT * FROM AnimeEntity WHERE id= :id")
  Future<AnimeEntity?> checkIsFavorite(int id);
}
