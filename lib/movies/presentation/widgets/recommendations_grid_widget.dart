import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/constants/app_assets.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_state.dart';
import 'package:movies_app/movies/presentation/screens/movie_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationsGridWidget extends StatelessWidget {
  const RecommendationsGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: ((context, state) {
      switch (state.recommendationsState) {
        case RequestState.loading:
        return Container();
        case RequestState.loaded:
          return  SingleChildScrollView(
              child:SizedBox(
            height: MediaQuery.of(context).size.height*0.43 ,
            child : GridView.builder(
                itemCount: state.recommendationsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                      ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context )=>MovieDetailsScreen(id: state.recommendationsList[index].id) ));
                      },
                      child: FadeInUp(
                      
                          from: 20,
                          duration: const Duration(milliseconds: 500),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            child: (state.recommendationsList[index].backdropPath ==
                                    "")
                                ? Container(
                                    height: 170.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Image.asset(AppAssets.cinemaIcon),
                                  )
                                : CachedNetworkImage(
                                    imageUrl: EndPoints.imageUrl(state
                                        .recommendationsList[index].backdropPath),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: 170.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    height: 180.0,
                                    fit: BoxFit.cover,
                                  ),
                          )),
                    );
                  }),
            ),
          );
        case RequestState.error:
         
          return   SizedBox(
            height: double.maxFinite,
            child: Center(
              child: Text(state.recommendationsMessage),
            ),
          );
      }
    }));
  }
}
