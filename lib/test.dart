import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

void main() {
  runApp(const _LocalHeroApp());
}

class _LocalHeroApp extends StatelessWidget {
  const _LocalHeroApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocalHeroScope(
      duration: const Duration(milliseconds: 500),
      createRectTween: (begin, end) {
        return RectTween(begin: begin, end: end);
      },
      curve: Curves.easeInOut,
      child: const MaterialApp(
        home: _LocalHeroPlayground(),
      ),
    );
  }
}

class _LocalHeroPlayground extends StatelessWidget {
  const _LocalHeroPlayground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            tabs: <Widget>[
              Text('Move between containers'),
            ],
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: <Widget>[
              _AcrossContainersAnimation(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TileModel extends Equatable {
  const _TileModel({required this.image, required this.title});

  final String title;
  final Image image;

  @override
  List<Object?> get props => [image, title];

  @override
  String toString() {
    return title;
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    Key? key,
    required this.model,
    required this.size,
    this.onTap,
  }) : super(key: key);

  final _TileModel model;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return LocalHero(
      tag: model.title,
      child: GestureDetector(
        onTap: onTap,
        child: _RawTile(
          model: model,
          size: size,
        ),
      ),
    );
  }
}

class _RawTile extends StatelessWidget {
  const _RawTile({
    Key? key,
    required this.model,
    required this.size,
  }) : super(key: key);

  final _TileModel? model;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CircleAvatar(
          backgroundColor: Colors.white70,
          foregroundColor: Colors.black54,
          child: model!.image,
        ),
      ),
    );
  }
}

class _AcrossContainersAnimation extends StatefulWidget {
  const _AcrossContainersAnimation({
    Key? key,
  }) : super(key: key);

  @override
  _AcrossContainersAnimationState createState() =>
      _AcrossContainersAnimationState();
}

class _AcrossContainersAnimationState
    extends State<_AcrossContainersAnimation> {
  final List<_TileModel> rowTiles = <_TileModel>[];
  final List<_TileModel> colTiles = <_TileModel>[];

  @override
  void initState() {
    super.initState();
    final _TileModel tile = _TileModel(
        image: Image.asset('images/volleyball.png'), title: 'volleyball');
    rowTiles.add(tile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: <Widget>[
              ...rowTiles.map(
                (tile) => _Tile(
                  key: ValueKey(tile),
                  model: tile,
                  size: 200,
                  onTap: () {
                    setState(() {
                      colTiles.add(tile);
                      rowTiles.remove(tile);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Column(
            children: <Widget>[
              ...colTiles.map(
                (tile) => _Tile(
                  key: ValueKey(tile),
                  model: tile,
                  size: 80,
                  onTap: () {
                    setState(() {
                      rowTiles.add(tile);
                      colTiles.remove(tile);
                    });
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
