import 'package:flutter/material.dart';
import 'package:kf/widgets/main_drawer.dart';
import 'package:kf/widgets/word_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  void initState() {
    super.initState();
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
      if (_queryController.text == '') {
        _searchBoolean = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: !_searchBoolean ? const Text('All') : _serachTextField(),
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
      drawer: const MainDrawer(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: WordList(
              query: _query,
              difficuulty: 'none',
            ),
          ),
        ],
      ),
    );
  }
}
