import 'dart:async';

import 'package:dating_list/module/dating_list/cubit/dating_list_cubit.dart';
import 'package:dating_list/module/dating_list/cubit/dating_list_state.dart';
import 'package:dating_list/ui/widgets/dating_list_item_widget.dart';
import 'package:dating_list/ui/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/service_locator.dart';
import '../../../ui/widgets/search_app_bar_widget.dart';

class DatingListPage extends StatelessWidget {
  const DatingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DatingListCubit(rideRepository: sl()),
      child: DatingListPageView(),
    );
  }
}

class DatingListPageView extends StatefulWidget {
  const DatingListPageView({super.key});

  @override
  _DatingListPageViewState createState() => _DatingListPageViewState();
}

class _DatingListPageViewState extends State<DatingListPageView> {
  final ScrollController _scrollController = ScrollController();
  Timer? _debounce;
  bool atEnd = false;

  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController.addListener(_scrollListener);

    if (_debounce?.isActive ?? false) _debounce?.cancel();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        atEnd = true;
      });
      context.read<DatingListCubit>().fetchDatingList(loadMore: true);
    } else {
      setState(() {
        atEnd = false;
      });
    }
  }

  void fetchData() {
    context.read<DatingListCubit>().fetchDatingList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width / 2.3,
          flexibleSpace: SearchAppBar(
            title: 'Dating List',
          ),
        ),
        body: BlocBuilder<DatingListCubit, DatingListState>(
          builder: (context, state) {
            if (state.status == DatingListStatus.loading) {
              return LoadingIndicator();
            } else if (state.status == DatingListStatus.error) {
              return Center(
                child: Text(state.message),
              );
            } else if (state.status == DatingListStatus.success ||
                state.status == DatingListStatus.loadMore) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 40, left: 16, right: 16),
                      itemBuilder: (BuildContext context, int index) {
                        return DatingListItemWidget(
                          result: state.result[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: state.result.length,
                    ),
                  ),
                  if (state.status == DatingListStatus.loadMore) ...[
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ],
                  if (state.message == 'No more data') ...[
                    atEnd
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: Center(
                              child: Text(state.message),
                            ),
                          )
                        : const SizedBox.shrink()
                  ]
                ],
              );
            }
            return Center(
              child: Text("No Data....."),
            );
          },
        ),
      ),
    );
  }
}
