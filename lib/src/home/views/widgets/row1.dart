import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/src/home/bloc/calculator_bloc.dart';
import 'package:flutter_calculator/src/home/models/input.dart';
import 'package:flutter_calculator/src/home/views/widgets/primary_button.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

class Row1 extends StatelessWidget {
  const Row1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(
          text: 'C',
          iconColor: Colors.red,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  AllCleared(),
                );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.bracketsRoundBold,
          iconColor: Theme.of(context).primaryColor,
          onTap: () {},
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          icon: PhosphorIcons.percentBold,
          iconColor: Theme.of(context).primaryColor,
          onTap: () {},
        ),
        SizedBox(
          width: 3.w,
        ),
        PrimaryButton(
          text: '/',
          iconColor: Theme.of(context).primaryColor,
          onTap: () {
            context.read<CalculatorBloc>().add(
                  const InputInserted(
                    Input(
                      value: '/',
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
