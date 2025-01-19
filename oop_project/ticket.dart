abstract class Ticket {
  String _origin;
  String _destination;
  DateTime _departureTime;
  double _price;
  bool _isAvailable;

  Ticket(this._origin, this._destination, this._departureTime, this._price,
      [this._isAvailable = true]);

  String get origin => _origin;
  set origin(String value) => _origin = value;

  String get destination => _destination;
  set destination(String value) => _destination = value;

  DateTime get departureTime => _departureTime;
  set departureTime(DateTime value) => _departureTime = value;

  double get price => _price;
  set price(double value) => _price = value;

  bool get isAvailable => _isAvailable;
  set isAvailable(bool value) => _isAvailable = value;

  String toTextFormat();
  void displayDetails();
}


