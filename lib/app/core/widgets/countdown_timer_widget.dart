import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'app_text_style.dart';

class CountdownTimerWidget extends StatefulWidget {
  final DateTime expireDate;
  const CountdownTimerWidget({super.key, required this.expireDate});

  @override
  State<CountdownTimerWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late Timer _timer;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateDuration();
    _startTimer();
  }

  void _calculateDuration() {
    final now = DateTime.now();
    if (widget.expireDate.isAfter(now)) {
      _duration = widget.expireDate.difference(now);
    } else {
      _duration = Duration.zero;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _calculateDuration();
          if (_duration.inSeconds <= 0) {
            _timer.cancel();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_duration.inSeconds <= 0) {
      return const SizedBox.shrink();
    }

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final days = _duration.inDays;
    final hours = twoDigits(_duration.inHours.remainder(24));
    final minutes = twoDigits(_duration.inMinutes.remainder(60));
    final seconds = twoDigits(_duration.inSeconds.remainder(60));

    return Row(
      children: [
        if (days > 0) ...[
          _buildTimeBox(days.toString(), "Days"),
          _buildSeparator(),
        ],
        _buildTimeBox(hours, "Hrs"),
        _buildSeparator(),
        _buildTimeBox(minutes, "Min"),
        _buildSeparator(),
        _buildTimeBox(seconds, "Sec"),
      ],
    );
  }

  Widget _buildTimeBox(String value, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          AppTextStyle(
            text: value,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          2.width,
          AppTextStyle(
            text: label,
            fontSize: 8.sp,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: const AppTextStyle(
        text: ":",
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }
}

extension on int {
  Widget get width => SizedBox(width: toDouble().w);
}
