import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<GetNowPlayingMovieBloc>().add(GetAllNowPlayingMovies());
      context.read<GetPopularMovieBloc>().add(GetAllPopularMovies());
      context.read<GetTopRatedMovieBloc>().add(GetAllTopRatedMovies());
    });
    Future.microtask(() {
      context.read<GetAiringTodayTvBloc>().add(GetAllAiringTodayTv());
      context.read<GetOnAirTvBloc>().add(GetAllOnAirTv());
      context.read<GetPopularTvBloc>().add(GetAllPopularTv());
      context.read<GetTopRatedTvBloc>().add(GetAllTopRatedTv());
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/circle-g.png'),
                ),
                accountName: Text('Ditonton'),
                accountEmail: Text('core@dicoding.com'),
              ),
              ListTile(
                leading: const Icon(Icons.movie),
                title: const Text('Movies'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.save_alt),
                title: const Text('Watchlist'),
                onTap: () {
                  Navigator.pushNamed(context, watchlistRoute);
                },
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, aboutRoute);
                },
                leading: const Icon(Icons.info_outline),
                title: const Text('About'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Ditonton'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, searchRoute);
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Column(
            children: const [
              TabBar(tabs: [
                Tab(text: 'Movies'),
                Tab(text: 'Tv Series'),
              ]),
              SizedBox(height: 16),
              Expanded(
                child: TabBarView(children: [
                  HomeMoviePage(),
                  HomeTvPage(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
