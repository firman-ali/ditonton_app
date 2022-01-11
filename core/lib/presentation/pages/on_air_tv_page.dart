import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnAirTvPage extends StatefulWidget {
  static const routeName = '/on-air-tv';

  const OnAirTvPage({Key? key}) : super(key: key);

  @override
  _OnAirTvPageState createState() => _OnAirTvPageState();
}

class _OnAirTvPageState extends State<OnAirTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<OnAirTvNotifier>(context, listen: false).fetchOnAirTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On The Air Tv Show'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<OnAirTvNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.isLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = data.tvSeries[index];
                  return TvCard(movie);
                },
                itemCount: data.tvSeries.length,
              );
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}
