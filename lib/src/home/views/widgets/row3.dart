import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/src/home/bloc/calculator_bloc.dart';
import 'package:flutter_calculator/src/home/models/input.dart';
import 'package:flutter_calculator/src/home/views/widgets/primary_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class Row3 extends StatelessWidget {
  const Row3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(
          icon: PhosphorIcons.numberFourBold,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(value: '4'),
                  ),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.numberFiveBold,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(value: '5'),
                  ),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.numberSixBold,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(value: '6'),
                  ),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.minusBold,
          iconColor: Theme.of(context).primaryColor,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(
                      value: '-',
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
