import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_strings.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_events.dart';
import 'package:movies_app/movies/presentation/widgets/movie_details_widget.dart';
import 'package:movies_app/movies/presentation/widgets/recommendations_grid_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;

  const MovieDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => sl<MovieDetailsBloc>()
          ..add(GetMovieDetailsEvents(id: id))
          ..add(GetMovieRecommendationsEvent(id: id)),
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const MovieDetailsWidget(),
                const SizedBox(
                  height: 30.0,
                ),
                FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: const Text(
                    AppStrings.moreLikeThis,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                 const SizedBox(
                  height: 5.0,
                ),
              
                const RecommendationsGridWidget()
              ]),
        )));
  }
}
