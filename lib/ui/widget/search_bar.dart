import 'package:flutter/material.dart';

class ReuseableSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final String hintText;
  final List<String> suggestions;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final double? expandedWidth;
  final Duration animationDuration;

  const ReuseableSearchBar({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.hintText = 'Search...',
    required this.suggestions,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.iconColor = Colors.grey,
    this.expandedWidth,
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  _ReuseableSearchBarState createState() => _ReuseableSearchBarState();
}

class _ReuseableSearchBarState extends State<ReuseableSearchBar> {
  bool _isExpanded = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && widget.controller.text.isEmpty) {
        setState(() {
          _isExpanded = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double availableWidth = MediaQuery.of(context).size.width - 120; // Account for other app bar items
    final double expandedWidth = widget.expandedWidth != null
        ? (widget.expandedWidth! > availableWidth ? availableWidth : widget.expandedWidth!)
        : availableWidth * 0.7;

    return AnimatedContainer(
      duration: widget.animationDuration,
      width: _isExpanded ? expandedWidth : 40,
      height: 40,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.search, color: widget.iconColor),
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
                if (_isExpanded) {
                  FocusScope.of(context).requestFocus(_focusNode);
                }
              });
            },
          ),
          if (_isExpanded)
            Expanded(
              child: TextField(
                focusNode: _focusNode,
                controller: widget.controller,
                onChanged: widget.onChanged,
                style: TextStyle(color: widget.textColor),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: widget.textColor.withOpacity(0.7)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(bottom: 15),
                ),
              ),
            ),
        ],
      ),
    );
  }
}