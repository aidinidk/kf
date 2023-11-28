import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kf/providers/difficulty_provider.dart';
import 'package:kf/theme/theme_manager.dart';
import 'package:kf/widgets/main_drawer.dart';
import 'package:kf/widgets/word_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen(
      {super.key, required this.themeManager, required this.notifyParent});
  final ThemeManager themeManager;
  final Function() notifyParent;
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Widget _serachTextField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        onEditingComplete: _serached,
        controller: _queryController,
        onChanged: _onQueryChanged,
        decoration: const InputDecoration(
          floatingLabelStyle: TextStyle(color: Colors.transparent),
          labelText: 'Search',
        ),
        autofocus: true,
      ),
    );
  }

  bool _searchBoolean = false;
  @override
  void dispose() {
    _queryController;
    super.dispose();
  }

  void _serached() {
    FocusScope.of(context).unfocus();
  }

  String _query = '';

  final _queryController = TextEditingController();

  void _onQueryChanged(String newQuery) {
    setState(() {
      _query = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    var title = '';
    List<String> filterText = [];
    final activeFilters = ref.watch(filtersProvider);
    if (activeFilters[Difficulty.a1]! ||
        activeFilters[Difficulty.a2]! ||
        activeFilters[Difficulty.b1]! ||
        activeFilters[Difficulty.b2]!) {
      title = ' :فیلتر شده';
    }
    if (activeFilters[Difficulty.a1]!) {
      filterText.add('A1');
    }
    if (activeFilters[Difficulty.a2]!) {
      filterText.add('A2');
    }
    if (activeFilters[Difficulty.b1]!) {
      filterText.add('B1');
    }
    if (activeFilters[Difficulty.b2]!) {
      filterText.add('B2');
    }
    Widget appBarTitle =
        title == '' ? const Text('همه') : Text('$filterText $title');

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.copyWith().surface,
      drawer: MainDrawer(
        themeManager: widget.themeManager,
        notifyParent: widget.notifyParent,
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      resizeToAvoidBottomInset: true,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              floating: true,
              snap: true,
              title: !_searchBoolean ? appBarTitle : _serachTextField(),
              actions: !_searchBoolean
                  ? [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _searchBoolean = true;
                            });
                          },
                          icon: const Icon(Icons.search))
                    ]
                  : [
                      IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _query = '';
                              _queryController.clear();
                              _searchBoolean = false;
                            });
                          })
                    ]),
        ],
        body: WordList(
          query: _query,
          difficuulty: 'none',
        ),
      ),
    );
  }
}
