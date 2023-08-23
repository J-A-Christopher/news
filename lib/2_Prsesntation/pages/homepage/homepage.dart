import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/2_Prsesntation/bloc/news_bloc.dart';
import 'package:news/2_Prsesntation/pages/homepage/widgets/error_message.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News...'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<NewsBloc>(context).add(GetNews());
                  },
                  child: const Text('Get News')),
              BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
                if (state is NewsInitial) {
                  return const Text('Click the button to get some news');
                } else if (state is NewsLoading) {
                  return const CircularProgressIndicator();
                } else if (state is NewsLoaded) {
                  return Text('${state.result}');
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
