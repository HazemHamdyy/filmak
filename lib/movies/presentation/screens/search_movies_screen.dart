import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/movies/presentation/controllers/movies_state.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';

class SearchMoviesScreen extends StatefulWidget {
  final String searchQuery;
  const SearchMoviesScreen({Key? key, required this.searchQuery})
      : super(key: key);

  @override
  State<SearchMoviesScreen> createState() => _SearchMoviesScreenState();
}

class _SearchMoviesScreenState extends State<SearchMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()
        ..add(GetSearcheMoviesEvent(searchingString: widget.searchQuery)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.searchQuery),
        ),
        body: BlocBuilder<MoviesBloc, MoviesState>(
          buildWhen: ((previous, current) =>
              previous.searchedMoviesList != current.searchedMoviesList),
          builder: (context, state) {
            switch (state.searchedMoviesState) {
              case RequestState.loading:
                return Container();
              case RequestState.loaded:
                return (state.searchedMoviesList.isEmpty)
                    ? Center(
                        child: Text("NO DATA IS THERE...",
                            style: TextStyle(fontSize: 40)))
                    : ListView.builder(
                        itemCount: state.searchedMoviesList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          MovieDetailsScreen(
                                              id: state
                                                  .searchedMoviesList[index]
                                                  .id)));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 5),
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height: double.infinity,
                                      child: (state.searchedMoviesList[index]
                                                  .backdropPath ==
                                              "")
                                          ? Image.asset(
                                              AppAssets.cinemaIcon,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              EndPoints.imageUrl(state
                                                  .searchedMoviesList[index]
                                                  .backdropPath),
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 25, 5, 5),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: Text(
                                              state.searchedMoviesList[index]
                                                  .title,
                                              style:
                                                  const TextStyle(fontSize: 20),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  10, 5, 10, 5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.red),
                                              height: 20,
                                              width: 45,
                                              child: Center(
                                                  child: Text(state
                                                      .searchedMoviesList[index]
                                                      .releaseDate
                                                      .split("-")[0])),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellowAccent,
                                              size: 18,
                                            ),
                                            Text(
                                              " ${state.searchedMoviesList[index].voteAvg.toString()}",
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                10, 10, 5, 5),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: Text(
                                              state.searchedMoviesList[index]
                                                  .overview,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
              case RequestState.error:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
