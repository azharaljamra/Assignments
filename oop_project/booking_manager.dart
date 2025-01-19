import 'booking.dart';
import 'bus_ticket.dart';
import 'plane_ticket.dart';
import 'ticket.dart';
import 'dart:io';



class BookingManager {
  final String _fileName;

  BookingManager(this._fileName);

  Future<void> _ensureFileExists() async {
    final file = File(_fileName);
    if (!file.existsSync()) {
      await file.create(recursive: true);
    }
  }

  Future<void> addBooking(Booking booking) async {
    await _ensureFileExists();
    final file = File(_fileName);
    await file.writeAsString(
      '${booking.customerName},${booking.customerPhone},${booking.ticket.toTextFormat()}\n',
      mode: FileMode.append,
    );
  }

  Future<List<Booking>> loadBookings() async {
    await _ensureFileExists();
    final file = File(_fileName);
    final lines = await file.readAsLines();

    return lines.map((line) {
      final parts = line.split(',');
      final ticketType = parts[2];
      Ticket ticket;

      if (ticketType == 'plane') {
        ticket = PlaneTicket(
          parts[3],
          parts[4],
          DateTime.parse(parts[5]),
          double.parse(parts[6]),
          double.parse(parts[8]),
        )..isAvailable = parts[7] == 'true';
      } else if (ticketType == 'bus') {
        ticket = BusTicket(
          parts[3],
          parts[4],
          DateTime.parse(parts[5]),
          double.parse(parts[6]),
          parts[8],
        )..isAvailable = parts[7] == 'true';
      } else {
        throw Exception('Unknown ticket type');
      }

      return Booking(parts[0], parts[1], ticket);
    }).toList();
  }

  Future<double> getTotalRevenue() async {
    final bookings = await loadBookings();
    return bookings.fold<double>(0.0, (sum, booking) => sum + booking.ticket.price);
  }

  Future<int> getTotalBookings() async {
    final bookings = await loadBookings();
    return bookings.length;
  }
}
