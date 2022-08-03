import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/src/home/bloc/calculator_bloc.dart';
import 'package:flutter_calculator/src/home/models/input.dart';
import 'package:flutter_calculator/src/home/views/widgets/primary_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class Row5 extends StatelessWidget {
  const Row5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(
          icon: PhosphorIcons.plusMinusBold,
          onTap: () {},
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.numberZeroBold,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(value: '0'),
                  ),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.wifiNoneBold,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(value: '.'),
                  ),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.equalsBold,
          color: Theme.of(context).primaryColor,
          iconColor: Colors.white,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  AnswerDisplayed(),
                );
          },
        ),
      ],
    );
  }
}
