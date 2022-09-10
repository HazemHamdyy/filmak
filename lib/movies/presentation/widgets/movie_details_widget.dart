import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_strings.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_state.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
      switch (state.movieDetailsState) {
        case RequestState.loading:
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const Center(child: CircularProgressIndicator()));
        case RequestState.loaded:
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        // fromLTRB
                        Colors.transparent,
                        Colors.black,
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0, 0.3, 0.5, 1],
                    ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: (state.movieDetails!.backdropPath == "")
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.asset(AppAssets.cinemaIcon),
                        )
                      : CachedNetworkImage(
                          height: MediaQuery.of(context).size.height * 0.3,
                          imageUrl: EndPoints.imageUrl(
                              state.movieDetails!.backdropPath),
                          fit: BoxFit.cover,
                        ),
                ),
                Text(state.movieDetails!.title,
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    )),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        state.movieDetails!.releaseDate.split('-')[0],
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          (state.movieDetails!.voteAvg / 2).toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          '(${state.movieDetails!.voteAvg})',
                          style: const TextStyle(
                            fontSize: 1.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      _showDuration(state.movieDetails!.runtime),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  state.movieDetails!.overview,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${AppStrings.genres}: ${_showGenres(state.movieDetails!.genres)}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          );
        case RequestState.error:
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child: Text(state.movieDetailsMessage),
            ),
          );
      }
    });
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
