import 'package:flutter/material.dart';

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;
  final String overlayText;

  const SavingInProgressOverlay({
    Key? key,
    required this.isSaving,
    required this.overlayText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(
                overlayText,
                style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}