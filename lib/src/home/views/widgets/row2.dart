import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/src/home/bloc/calculator_bloc.dart';
import 'package:flutter_calculator/src/home/models/input.dart';
import 'package:flutter_calculator/src/home/views/widgets/primary_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class Row2 extends StatelessWidget {
  const Row2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(
          icon: PhosphorIcons.numberSevenBold,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(value: '7'),
                  ),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.numberEightBold,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(value: '8'),
                  ),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.numberNineBold,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(value: '9'),
                  ),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.xBold,
          iconColor: Theme.of(context).primaryColor,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(
                      value: '*',
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
