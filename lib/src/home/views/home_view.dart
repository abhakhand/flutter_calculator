import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/src/home/bloc/calculator_bloc.dart';
import 'package:flutter_calculator/src/home/views/widgets/input_field.dart';
import 'package:flutter_calculator/src/home/views/widgets/row1.dart';
import 'package:flutter_calculator/src/home/views/widgets/row2.dart';
import 'package:flutter_calculator/src/home/views/widgets/row3.dart';
import 'package:flutter_calculator/src/home/views/widgets/row4.dart';
import 'package:flutter_calculator/src/home/views/widgets/row5.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorBloc(),
      child: Builder(
        builder: (context) {
          return Material(
            child: Padding(
              padding: EdgeInsets.all(4.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 4.0.w,
                        right: 4.0.w,
                        top: 8.0.h,
                        bottom: 6.0.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Expanded(
                            child: InputField(),
                          ),
                          BlocBuilder<CalculatorBloc, CalculatorState>(
                            builder: (context, state) {
                              return Text(
                                state.answer,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withAlpha(100),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          InkWell(
                            onLongPress: () async {
                              final count = context
                                  .read<CalculatorBloc>()
                                  .state
                                  .equation
                                  .length;

                              for (var i = 0; i < count; i++) {
                                context.read<CalculatorBloc>().add(
                                      BackspaceInserted(),
                                    );

                                await Future<void>.delayed(
                                  const Duration(milliseconds: 50),
                                );
                              }
                            },
                            child: IconButton(
                              onPressed: () {
                                context.read<CalculatorBloc>().add(
                                      BackspaceInserted(),
                                    );
                              },
                              icon: Icon(
                                PhosphorIcons.backspaceBold,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withAlpha(100),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 8.0.w,
                      ),
                      const Row1(),
                      SizedBox(
                        height: 4.0.w,
                      ),
                      const Row2(),
                      SizedBox(
                        height: 4.0.w,
                      ),
                      const Row3(),
                      SizedBox(
                        height: 4.0.w,
                      ),
                      const Row4(),
                      SizedBox(
                        height: 4.0.w,
                      ),
                      const Row5(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
