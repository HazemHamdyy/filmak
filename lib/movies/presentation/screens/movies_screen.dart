
import 'package:flutter/material.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/movies/presentation/screens/search_movies_screen.dart';
import 'package:movies_app/movies/presentation/widgets/now_playing_movies_widget.dart';
import 'package:movies_app/movies/presentation/widgets/popular_movies_widget.dart';
import 'package:movies_app/movies/presentation/widgets/top_rated_movies_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        
          body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingMoviesWidget(),
            
            const PopularMoviesWidget(),
          
            const TopRatedMoviesWidget(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        iconSize: 30,
        icon: Icon(Icons.search),
        onPressed: () {
          showSearch(context: context, delegate: SearchDelegateWiget());
          // showDialog(context: context, builder: (BuildContext context) {
          //   return Container(
          //     color: Colors.red,
          //   );
          // });
          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context )=>SearchMoviesScreen() ));
        },
      
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }
}

class SearchDelegateWiget extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [IconButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context )=>SearchMoviesScreen(searchQuery: ( query =="" ) ? "No Data Is There" : query,) ));
   }, icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon:Icon( Icons.arrow_back));

  }

  @override
  Widget buildResults(BuildContext context) {
      
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
