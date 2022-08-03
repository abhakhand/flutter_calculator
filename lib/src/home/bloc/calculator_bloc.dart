import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_calculator/src/home/models/input.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:rxdart/rxdart.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

const debounceDuration = Duration(milliseconds: 400);

EventTransformer<E> debounceRestartable<E>([
  Duration duration = debounceDuration,
]) {
  return (events, mapper) {
    return restartable<E>().call(
      events.debounceTime(duration),
      mapper,
    );
  };
}

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState()) {
    on<InputInserted>(_onInputInserted);
    on<EquationUpdated>(_onEquationUpdated);
    on<EquationCalculated>(
      _onEquationCalculated,
      transformer: debounceRestartable(),
    );
    on<AnswerDisplayed>(_onAnswerDisplayed);
    on<AnswerCleared>(_onAnswerCleared);
    on<BackspaceInserted>(
      _onBackspaceInserted,
      transformer: sequential(),
    );
    on<AllCleared>(_onAllCleared);
  }

  void _onInputInserted(
    InputInserted event,
    Emitter<CalculatorState> emit,
  ) {
    emit(
      state.copyWith(
        inputStatus: Status.inProgress,
        input: event.input,
      ),
    );

    emit(
      state.copyWith(
        inputStatus: Status.complete,
      ),
    );
  }

  void _onEquationUpdated(
    EquationUpdated event,
    Emitter<CalculatorState> emit,
  ) {
    emit(
      state.copyWith(
        equation: event.equation,
      ),
    );

    add(EquationCalculated());
  }

  void _onEquationCalculated(
    EquationCalculated event,
    Emitter<CalculatorState> emit,
  ) {
    final parser = Parser();
    final expression = parser.parse(state.equation);
    final contextModel = ContextModel();
    final evaluation = expression.evaluate(
      EvaluationType.REAL,
      contextModel,
    );

    if (!evaluation.toString().contains(RegExp(r'[+-/x]')) ||
        double.parse(evaluation.toString()).toInt().toString() ==
            state.equation) return;

    var result = '';
    final splits = evaluation.toString().split('.');
    if (int.parse(splits[1]) == 0) {
      result = splits[0];
    } else {
      result = evaluation.toString();
    }

    emit(
      state.copyWith(
        answer: result,
      ),
    );
  }

  void _onAnswerDisplayed(
    AnswerDisplayed event,
    Emitter<CalculatorState> emit,
  ) {
    emit(
      state.copyWith(
        answerStatus: Status.inProgress,
      ),
    );

    emit(
      state.copyWith(
        answerStatus: Status.complete,
      ),
    );
  }

  void _onAnswerCleared(
    AnswerCleared event,
    Emitter<CalculatorState> emit,
  ) {
    emit(
      state.copyWith(
        answer: '',
      ),
    );
  }

  void _onBackspaceInserted(
    BackspaceInserted event,
    Emitter<CalculatorState> emit,
  ) {
    emit(
      state.copyWith(
        backspaceStatus: Status.inProgress,
      ),
    );

    emit(
      state.copyWith(
        backspaceStatus: Status.complete,
      ),
    );
  }

  void _onAllCleared(
    AllCleared event,
    Emitter<CalculatorState> emit,
  ) {
    emit(
      state.copyWith(
        allClearStatus: Status.inProgress,
        input: Input.empty,
        equation: '',
      ),
    );

    emit(
      state.copyWith(
        allClearStatus: Status.complete,
      ),
    );
  }
}
