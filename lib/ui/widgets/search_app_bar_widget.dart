import 'package:dating_list/constants/app_colors.dart';
import 'package:dating_list/utils/extension/extended_context.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget {
  final String title;

  const SearchAppBar({Key? key, required this.title}) : super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColors.primaryBlue),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {},
              ),

              Text(
                widget.title,
                style: context.textTheme.headlineMedium!
                    .copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Center(
              child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.black),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.transparent,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
