import 'dart:async';
import 'package:flutter/material.dart';

class ExerciseTimer extends StatefulWidget {
  final int duration;
  final VoidCallback onTimerEnd;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final bool autoRestart;
  final bool isRunning;

  const ExerciseTimer({
    required this.duration,
    required this.onTimerEnd,
    required this.onNext,
    required this.onPrevious,
    this.autoRestart = false, // Valor por defecto es false
    this.isRunning = true,
    super.key,
  });

  @override
  State <ExerciseTimer> createState() => _ExerciseTimerState();
}

class _ExerciseTimerState extends State<ExerciseTimer> {
  late int _seconds;
  late bool _isRunning;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _seconds = widget.duration;
    _isRunning = widget.isRunning; // Establece el estado inicial
    if (_isRunning) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
        _isRunning = false;
        widget.onTimerEnd();
        if (widget.autoRestart) {
          _restartTimer();
        }
      } else if (_isRunning) {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  void _pauseOrResume() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _startTimer(); // Inicia el temporizador si se reanuda
      } else {
        _timer.cancel(); // Detiene el temporizador si se pausa
      }
    });
  }

  void _reset() {
    setState(() {
      _seconds = widget.duration;
      _isRunning = false; // Establece el temporizador en pausa al reiniciar
    });
  }

  void _restartTimer() {
    _reset();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int minutes = _seconds ~/ 60;
    int seconds = _seconds % 60;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, size: 40),
              onPressed: widget.onPrevious,
            ),
            const SizedBox(width: 20),
            Text(
              '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.arrow_forward, size: 40),
              onPressed: widget.onNext,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow, size: 40),
              onPressed: _pauseOrResume,
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.replay, size: 40),
              onPressed: _reset,
            ),
          ],
        ),
      ],
    );
  }
}
