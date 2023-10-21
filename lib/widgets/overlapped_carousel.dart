library overlapped_carousel;

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tims/theme/app_theme.dart';

class OverlappedCarousel extends StatefulWidget {
  final List<Widget> widgets;
  final Function(int) onClicked;
  final int? currentIndex;
  //final void Function(dynamic) onChanged;
  final ValueChanged<double>? onChanged;
  OverlappedCarousel(
      {required this.widgets,
      required this.onClicked,
      this.currentIndex,
      required this.onChanged});

  @override
  _OverlappedCarouselState createState() => _OverlappedCarouselState();
}

class _OverlappedCarouselState extends State<OverlappedCarousel> {
  double currentIndex = 2;
  bool isTablet = SizerUtil.deviceType == DeviceType.tablet;
  @override
  void initState() {
    if (widget.currentIndex != null)
      currentIndex = widget.currentIndex!.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                var indx = currentIndex - details.delta.dx * .02;

                if (indx >= -0.1 && indx <= widget.widgets.length - 1)
                  currentIndex = indx;
              });
            },
            onPanEnd: (details) {
              setState(() {
                currentIndex = currentIndex.round().toDouble();
              });
              widget.onChanged!(currentIndex);
            },
            child: OverlappedCarouselCardItems(
              cards: List.generate(
                widget.widgets.length,
                (index) => CardModel(id: index, child: widget.widgets[index]),
              ),
              centerIndex: currentIndex,
              maxWidth: constraints.maxWidth,
              maxHeight: constraints.maxHeight,
              onClicked: widget.onClicked,
            ),
          );
        },
      ),
    );
  }
}

class OverlappedCarouselCardItems extends StatelessWidget {
  final List<CardModel> cards;
  final Function(int) onClicked;
  final double centerIndex;
  final double maxHeight;
  final double maxWidth;

  OverlappedCarouselCardItems({
    required this.cards,
    required this.centerIndex,
    required this.maxHeight,
    required this.maxWidth,
    required this.onClicked,
  });

  double getCardPosition(int index) {
    bool isTablet = SizerUtil.deviceType == DeviceType.tablet;

    final double center = maxWidth / 2;
    final double centerWidgetWidth = maxWidth / 4;
    final double basePosition = isTablet
        ? center - centerWidgetWidth / 2 - 10.3.w
        : center - centerWidgetWidth / 2 - 12.w;
    final distance = centerIndex - index;

    final double nearWidgetWidth = centerWidgetWidth / 5 * 4;
    final double farWidgetWidth = centerWidgetWidth / 5 * 3;

    if (distance == 0) {
      return basePosition;
    } else if (distance.abs() > 0.0 && distance.abs() <= 1.0) {
      if (distance > 0) {
        return basePosition - nearWidgetWidth * distance.abs();
      } else {
        return basePosition + centerWidgetWidth * distance.abs();
      }
    } else if (distance.abs() >= 1.0 && distance.abs() <= 2.0) {
      if (distance > 0) {
        return (basePosition - nearWidgetWidth) -
            farWidgetWidth * (distance.abs() - 1.4);
      } else {
        return (basePosition + centerWidgetWidth + nearWidgetWidth) +
            farWidgetWidth * (distance.abs() - 2) -
            (nearWidgetWidth - farWidgetWidth) *
                ((distance - distance.floor()));
      }
    } else {
      if (distance > 0) {
        return (basePosition - nearWidgetWidth) -
            farWidgetWidth * (distance.abs() - 1);
      } else {
        return (basePosition + centerWidgetWidth + nearWidgetWidth) +
            farWidgetWidth * (distance.abs() - 2);
      }
    }
  }

  double getCardWidth(int index) {
    bool isTablet = SizerUtil.deviceType == DeviceType.tablet;

    final double distance = (centerIndex - index).abs();
    final double centerWidgetWidth = isTablet ? maxWidth / 2 : maxWidth / 1.8;
    final double nearWidgetWidth = centerWidgetWidth / 5 * 4.5;
    final double farWidgetWidth = centerWidgetWidth / 5 * 3.5;

    if (distance >= 0.0 && distance < 1.0) {
      return centerWidgetWidth -
          (centerWidgetWidth - nearWidgetWidth) * (distance - distance.floor());
    } else if (distance >= 1.0 && distance < 2.0) {
      return nearWidgetWidth -
          (nearWidgetWidth - farWidgetWidth) * (distance - distance.floor());
    } else {
      return farWidgetWidth;
    }
  }

  Matrix4 getTransform(int index) {
    final distance = centerIndex - index;

    var transform = Matrix4.identity()
      ..setEntry(3, 2, 0.007)
      ..rotateY(-0.30 * distance);
    //   ..scale(1.25, 1.25, 1.25);
    // if (index == centerIndex) transform.scale(1.05, 1.05, 1.05);
    return transform;
  }

  Widget _buildItem(CardModel item) {
    final int index = item.id;
    final width = getCardWidth(index);
    final height = maxHeight - 15 * (centerIndex - index).abs();
    final position = getCardPosition(index);
    final verticalPadding = width * 0.05 * (centerIndex - index).abs();

    return Positioned(
      left: position,
      child: Transform(
        transform: getTransform(index),
        alignment: FractionalOffset.center,
        child: AnimatedOpacity(
          duration: Duration.zero,
          opacity: index == centerIndex
              ? 1
              : ((index == centerIndex + 1 || index == centerIndex - 1)
                  ? .8
                  : .3),
          child: Container(
            width: width.toDouble(),
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            height: height > 0 ? height : 0,
            child: item.child,
          ),
        ),
      ),
    );
  }

  List<Widget> _sortedStackWidgets(List<CardModel> widgets) {
    for (int i = 0; i < widgets.length; i++) {
      if (widgets[i].id == centerIndex) {
        widgets[i].zIndex = widgets.length.toDouble();
      } else if (widgets[i].id < centerIndex) {
        widgets[i].zIndex = widgets[i].id.toDouble();
      } else {
        widgets[i].zIndex =
            widgets.length.toDouble() - widgets[i].id.toDouble();
      }
    }
    widgets.sort((a, b) => a.zIndex.compareTo(b.zIndex));
    return widgets.map((e) {
      double distance = (centerIndex - e.id).abs();
      if (distance >= 0 && distance <= 2)
        return _buildItem(e);
      else
        return Container();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: _sortedStackWidgets(cards),
      ),
    );
  }
}

class CardModel {
  final int id;
  double zIndex;
  final Widget? child;

  CardModel({required this.id, this.zIndex = 0.0, this.child});
}
