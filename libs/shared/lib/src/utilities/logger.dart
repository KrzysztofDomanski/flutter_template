import 'package:logger/logger.dart';

Logger _logger = Logger(level: Logger.level);

/// Logs an error message
void logE(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.e(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );

/// Logs a warning message
void logW(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.w(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );

/// Logs an information message
void logI(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.i(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );

/// Logs a debug message
void logD(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.d(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );

/// Logs a trace message
void logT(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.t(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );

/// Logs a fatal message. Should only be used during development to guard
/// against development problems.
void logF(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.f(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
