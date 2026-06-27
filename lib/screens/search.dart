import 'package:flutter/material.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({super.key});

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<String> simpleSearchList = [
    'Apple', 'Banana', 'Cherry', 'Date', 'Elderberry', 'Fig', 'Grape',
    'Honeydew', 'Kiwi', 'Lemon', 'Mango', 'Nectarine', 'Orange', 'Papaya',
    'Peach', 'Pear', 'Pineapple', 'Plum', 'Pomegranate', 'Raspberry',
    'Strawberry', 'Watermelon',
  ];

  List<String> matchingResults = [];

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
        if (!_focusNode.hasFocus) {
          matchingResults = [];
          _controller.clear();
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _filterList(String item) {
    setState(() {
      matchingResults = item.isEmpty
          ? simpleSearchList
          : simpleSearchList
              .where((i) => i.toLowerCase().contains(item.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S E A R C H'),
        backgroundColor: Colors.deepOrange[100],
        foregroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          _controller.clear();
                          _filterList('');
                          setState(() {});
                        },
                        icon: const Icon(Icons.close),
                      )
                    : null,
              ),
              onChanged: (item) {
                _filterList(item);
              },
            ),
            if (_isFocused)
              Expanded(
                child: matchingResults.isEmpty
                    ? const Center(child: Text('No results found'))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(title: Text(matchingResults[index]));
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(height: 1);
                        },
                        itemCount: matchingResults.length,
                      ),
              ),
          ],
        ),
      ),
    );
  }
}