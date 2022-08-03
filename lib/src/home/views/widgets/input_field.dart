import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calculator/src/home/bloc/calculator_bloc.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });

    _focusNode = FocusNode()..requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CalculatorBloc, CalculatorState>(
          listenWhen: (p, c) =>
              p.inputStatus != c.inputStatus &&
              c.inputStatus == Status.complete,
          listener: (context, state) {
            final text = _controller.text;
            final textSelection = _controller.selection;

            final newText = text.replaceRange(
              textSelection.start,
              textSelection.end,
              state.input.value,
            );

            final myTextLength = state.input.value.length;

            _controller
              ..text = newText
              ..selection = textSelection.copyWith(
                baseOffset: textSelection.start + myTextLength,
                extentOffset: textSelection.start + myTextLength,
              );

            context.read<CalculatorBloc>().add(
                  EquationUpdated(_controller.text),
                );
          },
        ),
        BlocListener<CalculatorBloc, CalculatorState>(
          listenWhen: (p, c) =>
              p.backspaceStatus != c.backspaceStatus &&
              c.backspaceStatus == Status.complete,
          listener: (context, state) {
            final text = _controller.text;
            final textSelection = _controller.selection;
            final selectionLength = textSelection.end - textSelection.start;

            // There is a selection
            if (selectionLength > 0) {
              final newText = text.replaceRange(
                textSelection.start,
                textSelection.end,
                '',
              );
              _controller
                ..text = newText
                ..selection = textSelection.copyWith(
                  baseOffset: textSelection.start,
                  extentOffset: textSelection.start,
                );
              return;
            }

            // The cursor is at the beginning.
            if (textSelection.start == 0) {
              return;
            }

            // Delete the previous character
            final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
            final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
            final newStart = textSelection.start - offset;
            final newEnd = textSelection.start;
            final newText = text.replaceRange(
              newStart,
              newEnd,
              '',
            );

            _controller
              ..text = newText
              ..selection = textSelection.copyWith(
                baseOffset: newStart,
                extentOffset: newStart,
              );

            context.read<CalculatorBloc>().add(AnswerCleared());
          },
        ),
        BlocListener<CalculatorBloc, CalculatorState>(
          listenWhen: (p, c) =>
              p.allClearStatus != c.allClearStatus &&
              c.allClearStatus == Status.complete,
          listener: (context, state) {
            _controller
              ..text = ''
              ..selection = _controller.selection.copyWith(
                baseOffset: 0,
                extentOffset: 0,
              );
          },
        ),
        BlocListener<CalculatorBloc, CalculatorState>(
          listenWhen: (p, c) =>
              p.answerStatus != c.answerStatus &&
              c.answerStatus == Status.complete,
          listener: (context, state) {
            _controller
              ..text = state.answer
              ..selection = _controller.selection.copyWith(
                baseOffset: state.answer.length,
                extentOffset: state.answer.length,
              );

            context.read<CalculatorBloc>().add(AnswerCleared());
          },
        ),
      ],
      child: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          return TextField(
            controller: _controller,
            focusNode: _focusNode,
            style: TextStyle(
              fontSize: _controller.text.length > 10 ? 30 : 40,
            ),
            keyboardType: TextInputType.none,
            textAlign: TextAlign.end,
            maxLines: null,
            expands: true,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: '',
            ),
          );
        },
      ),
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }
}
