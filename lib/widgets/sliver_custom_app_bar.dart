import 'package:flutter/material.dart';
import 'package:niaje/src/history/history_view.dart';
import 'package:niaje/src/settings/settings_view.dart';
import 'package:niaje/widgets/background_wave.dart';

class SliverCustomAppBar extends SliverPersistentHeaderDelegate {
  const SliverCustomAppBar();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // var adjustedShrinkOffset = shrinkOffset > minExtent ? minExtent : shrinkOffset;
    // double offset = (minExtent - adjustedShrinkOffset) * 0.5;
    double topPadding =
        MediaQuery.of(context).padding.top + 10; // + 16 (Default)

    return Stack(
      children: [
        const BackgroundWave(
          height: 200,
        ),
        Positioned(
          top: topPadding,
          left: 16,
          right: 16,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Niaje",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    "Your AI voice assistant",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.history, color: Colors.white),
                    onPressed: () {
                      Navigator.restorablePushNamed(
                          context, HistoryView.routeName);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      Navigator.restorablePushNamed(
                          context, SettingsView.routeName);
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
