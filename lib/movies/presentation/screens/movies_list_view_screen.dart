import 'package:flutter/material.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';

class MoviesListViewScreen extends StatelessWidget {
  final String listName;
  final List<Movie> moviesList;
  const MoviesListViewScreen(
      {Key? key, required this.listName, required this.moviesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(listName),
      ),
      body: ListView.builder(
          itemCount: moviesList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            MovieDetailsScreen(id: moviesList[index].id)));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: double.infinity,
                        child: (moviesList[index].backdropPath == "")
                            ? Image.asset(
                                AppAssets.cinemaIcon,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                EndPoints.imageUrl(
                                    moviesList[index].backdropPath),
                                fit: BoxFit.cover,
                              ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(10, 25, 5, 5),
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                moviesList[index].title,
                                style: const TextStyle(fontSize: 20),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red),
                                height: 20,
                                width: 45,
                                child: Center(
                                    child: Text(moviesList[index]
                                        .releaseDate
                                        .split("-")[0])),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellowAccent,
                                size: 18,
                              ),
                              Text(
                                " ${moviesList[index].voteAvg.toString()}",
                                style: const TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(10, 10, 5, 5),
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                moviesList[index].overview,
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
          }),
    );
  }
}
