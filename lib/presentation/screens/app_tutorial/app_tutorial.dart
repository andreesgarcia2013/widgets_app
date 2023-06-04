import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides=<SlideInfo>[
  SlideInfo('Busca la comida', 'Labore qui et do in adipisicing.', 'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Aute non commodo excepteur sint dolor nisi velit et voluptate minim reprehenderit laborum sit cillum.', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Minim qui sint in in proident mollit nisi.', 'assets/images/3.png')
];
class AppTutorialScreen extends StatefulWidget {
   static const name='app_tutorial';
  const AppTutorialScreen({Key? key}) : super(key: key);

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController=PageController();
  bool endReach=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewController.addListener(() {
      final page=pageViewController.page??0;
      if (!endReach && page >= (slides.length-1.5) ) {
        setState(() {
          endReach=true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slideData) => _Slide(
              title: slideData.title,
              caption: slideData.caption, 
              imageUrl: slideData.imageUrl
              )).toList()
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            )
          ),
          endReach ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: (){},
                child: const Text('Comenzar'),
              ),
            )
          )
          :const SizedBox()
        ],
      )
    );
  }
}

class _Slide extends StatelessWidget {
   final String title;
  final String caption;
  final String imageUrl;
  const _Slide({required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle=Theme.of(context).textTheme.titleLarge;
    final captionStyle=Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30,),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox( height: 20,),
            Text(title ,style: titleStyle,),
            SizedBox(height: 10,),
            Text(caption, style: captionStyle,)
          ],
        ),
      ),
    );
  }
}