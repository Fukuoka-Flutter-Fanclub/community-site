import 'package:flutter/material.dart';
import 'package:fukuoka_flutter_fanclub/features/atoms/responsive.dart';
import 'package:fukuoka_flutter_fanclub/features/nav/components/menu_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavPage extends ConsumerStatefulWidget {
  static String routeName = '/';

  final String path;
  final Widget child;

  const NavPage({
    super.key,
    required this.child,
    required this.path,
  });

  @override
  NavPageState createState() => NavPageState();
}

class NavPageState extends ConsumerState<NavPage> {
  @override
  void initState() {
    super.initState();
  }

  int get currentIndex =>
      MenuType.values.where((e) => e.path == widget.path).first.index;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: MenuType.values.length,
      child: SelectionArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            foregroundColor: Colors.black87,
            automaticallyImplyLeading: false,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 35,
                        ),
                      ),
                      const Text(
                        "Flutter Fukuoka Fanclub",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  if (!Responsive.isMobile(context))
                    Row(
                      children: MenuType.values.map((e) {
                        final isSelected = e.path == widget.path;
                        return GestureDetector(
                          onTap: () => context.go(e.path),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                e.label,
                                style: TextStyle(
                                    color:
                                        isSelected ? Colors.white : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                ]),
            actions: const [],
          ),
          body: widget.child,
          bottomNavigationBar: Responsive.isMobile(context)
              ? BottomNavigationBar(
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.grey,
                  currentIndex: currentIndex,
                  onTap: (index) => context.go(MenuType.values[index].path),
                  items: MenuType.values
                      .map((e) => BottomNavigationBarItem(
                          icon: Icon(e.icon), label: e.label))
                      .toList(),
                  type: BottomNavigationBarType.shifting,
                )
              : null,
        ),
      ),
    );
  }
}
