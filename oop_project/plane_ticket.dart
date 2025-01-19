import 'ticket.dart';

class PlaneTicket extends Ticket {
  double _baggageCount;

  PlaneTicket(String origin, String destination, DateTime departureTime,
      double price, this._baggageCount)
      : super(origin, destination, departureTime, price);

  double get baggageCount => _baggageCount;
  set baggageCount(double value) => _baggageCount = value;

  @override
  String toTextFormat() {
    return 'plane,$origin,$destination,$departureTime,$price,$isAvailable,$_baggageCount';
  }

  @override
  void displayDetails() {
    print(
        'Plane Ticket | Origin: $origin | Destination: $destination | Departure: $departureTime | Price: $price | Baggage: $baggageCount');
  }
}
