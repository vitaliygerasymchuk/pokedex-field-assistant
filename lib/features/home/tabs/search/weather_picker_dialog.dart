import 'package:flutter/material.dart';

typedef WeatherPick = ({double temperatureCelsius, double windSpeedMps});

class WeatherPickerDialog extends StatefulWidget {
  const WeatherPickerDialog({super.key});

  static Future<WeatherPick?> show(BuildContext context) {
    return showDialog<WeatherPick>(
      context: context,
      builder: (_) => const WeatherPickerDialog(),
    );
  }

  @override
  State<WeatherPickerDialog> createState() => _WeatherPickerDialogState();
}

class _WeatherPickerDialogState extends State<WeatherPickerDialog> {
  double _temp = 22;
  double _wind = 4;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Weather'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.thermostat),
              const SizedBox(width: 8),
              Text('Temperature'),
              const Spacer(),
              Text(
                '${_temp.toStringAsFixed(0)} °C',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Slider(
            min: -20,
            max: 45,
            divisions: 65,
            value: _temp,
            onChanged: (v) => setState(() => _temp = v),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.air),
              const SizedBox(width: 8),
              Text('Wind speed'),
              const Spacer(),
              Text(
                '${_wind.toStringAsFixed(1)} m/s',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Slider(
            min: 0,
            max: 30,
            divisions: 60,
            value: _wind,
            onChanged: (v) => setState(() => _wind = v),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(
            (temperatureCelsius: _temp, windSpeedMps: _wind),
          ),
          child: const Text('Suggest'),
        ),
      ],
    );
  }
}