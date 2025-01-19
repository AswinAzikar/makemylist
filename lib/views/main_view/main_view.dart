import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:makemylist/views/home_view.dart';
import 'package:makemylist/views/main_view/bloc/tabbar_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        context.read<TabbarBloc>().add(TabChanged(_tabController.index));
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabbarBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MakeMyList'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: BlocBuilder<TabbarBloc, TabbarState>(
              builder: (context, state) {
                if (state is TabSelected &&
                    _tabController.index != state.selectedIndex) {
                  _tabController.animateTo(state.selectedIndex);
                }

                return TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(icon: Icon(LucideIcons.activity)),
                    Tab(icon: Icon(LucideIcons.checkCircle2)),
                  ],
                );
              },
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomeView(),
            const Center(
              child: Text("Completed Tasks"),
            ),
          ],
        ),
      ),
    );
  }
}
