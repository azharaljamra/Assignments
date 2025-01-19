import 'ticket.dart';

class BusTicket extends Ticket {
  String _seatNumber;

  BusTicket(String origin, String destination, DateTime departureTime,
      double price, this._seatNumber)
      : super(origin, destination, departureTime, price);

  String get seatNumber => _seatNumber;
  set seatNumber(String value) => _seatNumber = value;

  @override
  String toTextFormat() {
    return 'bus,$origin,$destination,$departureTime,$price,$isAvailable,$seatNumber';
  }

  @override
  void displayDetails() {
    print(
        'Bus Ticket | Origin: $origin | Destination: $destination | Departure: $departureTime | Price: $price | Seat: $seatNumber');
  }
}
