import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fire_message/bloc/count_state.dart';

import 'bloc/count_bloc.dart';

class TabTwo extends StatefulWidget{
   TabTwo({Key? key}) : super(key: key);

  @override
  State<TabTwo> createState() => _TabTwoState();
}

class _TabTwoState extends State<TabTwo> with AutomaticKeepAliveClientMixin<TabTwo>{
  @override
  Widget build(BuildContext context) {
    var countBloc = BlocProvider.of<CountBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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