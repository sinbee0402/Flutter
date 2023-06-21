import 'package:clone_youtube/components/shorts.dart';
import 'package:clone_youtube/components/video.dart';
import 'package:flutter/material.dart';

import '../components/category.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        // Row 카테고리
        Container(
          height: 56,
          color: Colors.black,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 56,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.explore_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                Category('전체'),
                Category('게임'),
                Category('뉴스'),
                Category('실시간'),
                Category('믹스'),
                Category('노래'),
              ],
            ),
          ),
        ),
        // Video
        Video(
            'https://tn.tv.nate.com/unsafe/1280x720/https://fs.jtbc.co.kr/joydata/CP00000001/prog/media/voyage/img/20230517_194514_134_1.jpg',
            '28:28',
            'https://yt3.ggpht.com/LjGoq9rEwlUNNKHGZmbVMoC2Z6g9QULdshHqr6TJHOQ4_nqbGaRd9D7AZcITnzCJdXx3qXDYFnA=s68-c-k-c0x00ffffff-no-rj',
            '지금 봐도 대단했던 싱어게인 2화 요약.mp4 | 싱어게인 | JTBC 201123 방송',
            'JTBC Voyage'),
        Video(
            'https://i.ytimg.com/vi/DCbKibx9p5U/maxresdefault.jpg',
            '52:09',
            'https://yt3.ggpht.com/c3uDDw9UdUzt7MyjZkE5hq-FPB0THxPs0USiNC8n1aCDBIxwEqU09ImAzQ5D7M5zRWSy3-Xp=s48-c-k-c0x00ffffff-no-rj',
            '불멍하면서 듣는 조용한 일렉기타 playlist (cover)',
            'Doridol2'),
        // Row 쇼츠
        Container(
          color: Colors.black,
          child: Row(
            children: [
              Shorts('assets/shorts1.PNG', '[#비투비] 4개월만에 초코하임 먹고 신난 이창섭',
                  '조회수 373만회'),
              Shorts('assets/shorts2.PNG', '방귀 뀌었을 때 춰야하는 춤', '조회수 867만회'),
              Shorts(
                  'assets/shorts3.PNG', '인어공주 바위🔥해외 반응 #인어공주실사판', '조l회수 36만회'),
            ],
          ),
        )
      ],
    );
  }
}
