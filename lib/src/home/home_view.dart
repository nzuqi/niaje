import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:niaje/api/speech_api.dart';
import 'package:niaje/widgets/sliver_custom_app_bar.dart';
import 'package:niaje/util/common.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  String text = 'Press the mic & start speaking...';
  bool isListening = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            delegate: SliverCustomAppBar(),
            pinned: false,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        endRadius: 75,
        glowColor: Theme.of(context).primaryColor,
        child: FloatingActionButton(
          onPressed: toggleRecording,
          child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
        ),
      ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          logger.e(isListening);
          setState(() => this.isListening = isListening);

          if (!isListening) {
            Future.delayed(const Duration(seconds: 1), () {
              // Utils.scanText(text);
              logger.i(text);
            });
          }
        },
      ).then((value) => logger.e(value));
}
