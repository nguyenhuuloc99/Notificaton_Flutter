import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fire_message/bloc/count_event.dart';

import 'bloc/count_bloc.dart';
import 'bloc/count_state.dart';

class TabOne extends StatefulWidget {
  const TabOne({Key? key}) : super(key: key);

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne>
    with AutomaticKeepAliveClientMixin<TabOne> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    var countBloc = BlocProvider.of<CountBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              countBloc.add(Increase());
            },
            child: const Text("Increase")),
        BlocBuilder<CountBloc, CounterState>(
          builder: (context, state) {
            return Text("${countBloc.state.count}");
          },
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
