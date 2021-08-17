import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kulina/bloc/home_app_bar/home_app_bar_bloc.dart';

class HomeHeaderDate extends StatelessWidget{
  const HomeHeaderDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocProvider.value(
      value: context.watch<HomeAppBarBloc>(),
      child: BlocBuilder<HomeAppBarBloc, HomeAppBarState>(
          builder: (context, state) {
            if(state is HomeAppBarLoaded) {
              final date = context.read<HomeAppBarBloc>().selectedValue;
              final dateFormatted = DateFormat('EEEE, dd MMMM ''yyyy').format(date);
              return  Container(
                // color: Colors.red,
                width: width,
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                child: Text(
                    dateFormatted,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              );
            }
            else {
              return const Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }

}