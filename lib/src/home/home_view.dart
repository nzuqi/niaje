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
  final String defaultStr = 'Press the mic & start speaking...';
  late String text;
  late bool cleared;
  bool isListening = false;

  @override
  void initState() {
    cleared = true;
    text = defaultStr;
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      !isListening && !cleared
                          ? InkWell(
                              child: const Text(
                                "Clear text",
                                style: TextStyle(
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationStyle: TextDecorationStyle.dotted,
                                  decorationColor: Colors.red,
                                  shadows: [Shadow(color: Colors.red, offset: Offset(0, -4))],
                                ),
                              ),
                              onTap: () {
                                text = defaultStr;
                                cleared = true;
                                setState(() {});
                              },
                            )
                          : const SizedBox(),
                    ],
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

  Future toggleRecording() {
    return SpeechApi.toggleRecording(
      onResult: (text) {
        this.text = text;
        cleared = false;
        setState(() {});
      },
      onListening: (isListening) {
        this.isListening = isListening;
        setState(() {});

        if (!isListening) {
          Future.delayed(const Duration(seconds: 1), () {
            logger.i(text);
            // Make request to ChatGPT here...
          });
        }
      },
    );
  }
}
