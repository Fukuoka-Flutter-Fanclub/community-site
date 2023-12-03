import 'package:flutter/material.dart';
import 'package:fukuoka_flutter_fanclub/features/atoms/responsive.dart';
import 'package:fukuoka_flutter_fanclub/features/home/ui/widget/html_display_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';

  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return ColoredBox(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Image.asset(
                  'assets/images/hedder.png',
                  width: isMobile ? MediaQuery.of(context).size.width : 700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Flutterで繋がる、福岡のクリエイティブな仲間たち',
                  style: TextStyle(
                    fontSize: isMobile ? 20 : 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 100),
              const _AboutCommunity(),
              const SizedBox(height: 100),
              const _OurActivity(),
              const SizedBox(height: 100),
              const _JoinUs(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutCommunity extends StatelessWidget {
  const _AboutCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    const commonWidgets = <Widget>[
      Flexible(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'コミュニティについて',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '福岡のFlutterコミュニティへようこそ！\n私たちは、Flutterの魅力を広げ、地域の技術者をサポートすることに情熱を注いでいます。天神のエンジニアカフェで定期的に開催されるLT会を通じて、知識を共有し、互いに刺激を受ける場を提供しています',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 50,
        height: 50,
      ),
      Flexible(
        flex: 1,
        child: HTMLDisplayWidget(
          viewId: 'google_map',
          url:
              'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3323.4678752421196!2d130.39928067569682!3d33.59316287333327!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3541912c3f02d719%3A0x4c23e7b1d51ccd1!2z44Ko44Oz44K444OL44Ki44Kr44OV44Kn!5e0!3m2!1sja!2sjp!4v1701602333248!5m2!1sja!2sjp',
        ),
      ),
    ];
    if (Responsive.isMobile(context)) {
      return const Column(
          mainAxisSize: MainAxisSize.min, children: commonWidgets);
    } else {
      return const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: commonWidgets);
    }
  }
}

class _OurActivity extends StatelessWidget {
  const _OurActivity();

  @override
  Widget build(BuildContext context) {
    const commonWidgets = <Widget>[
      Flexible(
        flex: 1,
        child: HTMLDisplayWidget(
          viewId: 'youtube',
          url: 'https://www.youtube.com/embed/wFnNZAFfTEM',
        ),
      ),
      SizedBox(
        width: 50,
        height: 50,
      ),
      Flexible(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '私たちの活動',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Flutterを福岡で盛り上げるために、私たちは様々な活動を行っています。Flutterの基本から最新のトレンドまで、幅広い話題を取り扱っています。困っている人々を助け、クリエイティブなプロジェクトを共に作り上げることで、技術と想像力の限界を広げていきます。',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
    if (Responsive.isMobile(context)) {
      return Column(
          mainAxisSize: MainAxisSize.min,
          children: commonWidgets.reversed.toList());
    } else {
      return const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: commonWidgets);
    }
  }
}

class _JoinUs extends StatelessWidget {
  const _JoinUs();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 120),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          '参加方法',
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'あなたも私たちの一員になりませんか？\nFlutterに興味がある、何か新しいことを学びたい、創造的なプロジェクトに挑戦したい、あるいは単に技術に関する情報交換の場を探しているなら、ぜひ私たちのコミュニティに参加してください。\n次回のイベント情報もこちらからご覧いただけます。',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(50, 30, 50, 30)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 43, 0, 255)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () async {
              final url = Uri.parse('https://discord.gg/ktwjECBvQE');
              if (!await launchUrl(url)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$url を開けませんでした'),
                  ),
                );
              }
            },
            child: const Text('Discordに参加する',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ),
      ]),
    );
  }
}
