import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/constants/app_strings.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movies_state.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';
import 'package:movies_app/movies/presentation/screens/movies_list_view_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: ((previous, current) =>
            previous.popularMoviesState != current.popularMoviesState),
        builder: (context, state) {
          switch (state.popularMoviesState) {
            case RequestState.loading:
              return const SizedBox(
                  height: 240.0,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
              return SizedBox(
                height: 240,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.popular,
                            style: GoogleFonts.poppins(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MoviesListViewScreen(
                                              listName: "Popular Movies",
                                              moviesList:
                                                  state.popularMoviesList)));

                              /// TODO : NAVIGATION TO POPULAR SCREEN
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: const [
                                  Text(AppStrings.seeMore),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                        height: 170.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          itemCount: state.popularMoviesList.length,
                          itemBuilder: (context, index) {
                            final movie = state.popularMoviesList[index];
                            return Container(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              MovieDetailsScreen(
                                                  id: movie.id)));

                                  /// TODO : NAVIGATE TO  MOVIE DETAILS
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  child: (movie.backdropPath == "")
                                      ? Container(
                                          width: 120.0,
                                          child:
                                              Image.asset(AppAssets.cinemaIcon),
                                        )
                                      : CachedNetworkImage(
                                          width: 120.0,
                                          fit: BoxFit.cover,
                                          imageUrl: EndPoints.imageUrl(
                                              movie.backdropPath),
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            baseColor: Colors.grey[850]!,
                                            highlightColor: Colors.grey[800]!,
                                            child: Container(
                                              height: 170.0,
                                              width: 120.0,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );

            case RequestState.error:
              return SizedBox(
                height: 170.0,
                child: Center(
                  child: Text(state.popularMoviesMessage),
                ),
              );
          }
        });
  }
}
