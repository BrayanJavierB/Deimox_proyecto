import 'package:flutter/material.dart';
import 'package:deimoxapp/models/exercise.dart';
import 'package:deimoxapp/widgets/exercise_timer.dart';

class TimerScreen extends StatefulWidget {
  final List<Exercise> exercises;
  final int exerciseIndex;

  const TimerScreen({
    Key? key,
    required this.exercises,
    required this.exerciseIndex,
  }) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late int _currentExerciseIndex;
  late Exercise _currentExercise;
  late List<int> _originalDurations;
  late ExerciseTimer _exerciseTimer;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _currentExerciseIndex = widget.exerciseIndex;
    _currentExercise = widget.exercises[_currentExerciseIndex];
    _originalDurations = List.filled(widget.exercises.length, 30);
    _exerciseTimer = ExerciseTimer(
      duration: _originalDurations[_currentExerciseIndex],
      onTimerEnd: _goToNextExercise,
      onNext: _goToNextExercise,
      onPrevious: _goToPreviousExercise,
      autoRestart: true,
    );
    _scrollController = ScrollController();
  }

  void _goToNextExercise() {
    if (_currentExerciseIndex < widget.exercises.length - 1) {
      setState(() {
        _currentExerciseIndex++;
        _currentExercise = widget.exercises[_currentExerciseIndex];
        _resetTimer(_originalDurations[_currentExerciseIndex]);
      });
    }
  }

  void _goToPreviousExercise() {
    if (_currentExerciseIndex > 0) {
      setState(() {
        _currentExerciseIndex--;
        _currentExercise = widget.exercises[_currentExerciseIndex];
        _resetTimer(_originalDurations[_currentExerciseIndex]);
      });
    }
  }

  void _resetTimer(int duration) {
    _exerciseTimer = ExerciseTimer(
      key: UniqueKey(),
      duration: duration,
      onTimerEnd: _goToNextExercise,
      onNext: _goToNextExercise,
      onPrevious: _goToPreviousExercise,
      autoRestart: true,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pausa Activa: ${_currentExercise.name}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.green.shade200, Colors.green.shade400],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                _currentExercise.imagePath,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                _currentExercise.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _exerciseTimer,
            ],
          ),
        ),
      ),
    );
  }
}
