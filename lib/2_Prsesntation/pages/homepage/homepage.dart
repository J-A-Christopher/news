import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/2_Prsesntation/bloc/news_bloc.dart';
import 'package:news/2_Prsesntation/pages/homepage/widgets/error_message.dart';
import 'package:news/2_Prsesntation/pages/homepage/widgets/news_display.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(GetNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News...'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
                if (state is NewsInitial) {
                  return const Text('Click the button to get some news');
                } else if (state is NewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NewsLoaded) {
                  final articles = state.result;
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Image.network(
                                      articles?[index].urlToImage ??
                                          'https://www.shutterstock.com/shutterstock/photos/2294992053/display_1500/stock-vector-flat-picture-placeholder-symbol-for-the-app-website-or-user-interface-design-no-photo-thumbnail-2294992053.jpg',
                                      fit: BoxFit.cover,
                                      height: 120,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Text(
                                        '${articles?[index].title}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${articles?[index].content}',
                                        maxLines: 4,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: articles?.length,
                    ),
                  );
                  //Text('${state.result?.first.description}');
                } else if (state is NewsError) {
                  return ErrorMessage(message: state.error);
                }
                return const SizedBox.shrink();
              }),
            ],
          ),
        ));
  }
}
