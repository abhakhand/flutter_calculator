import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/src/home/bloc/calculator_bloc.dart';
import 'package:flutter_calculator/src/home/models/input.dart';
import 'package:flutter_calculator/src/home/views/widgets/primary_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class Row4 extends StatelessWidget {
  const Row4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(
          icon: PhosphorIcons.numberOneBold,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(value: '1'),
                  ),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.numberTwoBold,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(value: '2'),
                  ),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.numberThreeBold,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(value: '3'),
                  ),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.plusBold,
          iconColor: Theme.of(context).primaryColor,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(
                      value: '+',
                      isOperator: true,
                    ),
                  ),
                );
          },
        ),
      ],
    );
  }
}
