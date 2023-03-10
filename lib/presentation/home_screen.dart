import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/anime_list/anime_list_bloc.dart';
import '../model/anime_model.dart';
import '../shared/status_enum.dart';
import '../shared/style.dart';
import '../widget/anime_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AnimeListBloc, AnimeListState>(
          listener: (context, state) {
            if (state.status == Status.error) {
              AnimatedSnackBar.material(
                state.errorMessage,
                type: AnimatedSnackBarType.error,
              ).show(context);
            }
          },
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == Status.error) {
              return const Center(
                child: Text("Maaf terjadi kesalahan"),
              );
            } else if (state.status == Status.success) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Weabo App",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.animeList.length,
                      itemBuilder: (context, index) {
                        final AnimeModel anime = state.animeList[index];
                        return AnimeItem(
                            malId: anime.malId!,
                            imageUrl: anime.images!.jpg!.imageUrl!,
                            title: anime.title!,
                            score: anime.score!,
                            status: anime.status!,
                            synopsis: anime.synopsis!);
                      },
                    ),
                  ),
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
