/// Adds extensions to num (ie. int & double) to make creating durations simple:
///
/// ```dart
/// 200.ms // equivalent to Duration(milliseconds: 200)
/// 3.seconds // equivalent to Duration(milliseconds: 3000)
/// 1.5.days // equivalent to Duration(hours: 36)
/// ```
extension NumDurationExtensions on num {
  /// An extension on a number that rounds the number to a closes integer
  /// and returning it as a microsecond duration
  Duration get microseconds => Duration(microseconds: round());

  /// Returns a milisecond [Duration] on the number rounded to the
  /// nearest integer
  Duration get ms => (this * 1000).microseconds;

  /// Returns a milisecond [Duration] on the number rounded to the
  /// nearest integer
  Duration get milliseconds => (this * 1000).microseconds;

  /// Returns a second [Duration] on the number rounded to the nearest integer
  Duration get seconds => (this * 1000 * 1000).microseconds;

  /// Returns a minutes [Duration] on the number rounded to the nearest integer
  Duration get minutes => (this * 1000 * 1000 * 60).microseconds;

  /// Returns an hours [Duration] on the number rounded to the nearest integer
  Duration get hours => (this * 1000 * 1000 * 60 * 60).microseconds;

  /// Returns a days [Duration] on the number rounded to the nearest integer
  Duration get days => (this * 1000 * 1000 * 60 * 60 * 24).microseconds;
}
