import 'ticket.dart';
import 'bus_ticket.dart';
import 'plane_ticket.dart';
import 'dart:io';



class TicketManager {
  final String _fileName;

  TicketManager(this._fileName);

  Future<void> _ensureFileExists() async {
    final file = File(_fileName);
    if (!file.existsSync()) {
      await file.create(recursive: true);
    }
  }

  Future<void> saveTicket(Ticket ticket) async {
    await _ensureFileExists();
    final file = File(_fileName);
    await file.writeAsString('${ticket.toTextFormat()}\n',
        mode: FileMode.append);
  }

  Future<List<Ticket>> loadTickets() async {
    await _ensureFileExists();
    final file = File(_fileName);
    final lines = await file.readAsLines();

    return lines.map((line) {
      final parts = line.split(',');
      if (parts[0] == 'plane') {
        return PlaneTicket(
          parts[1],
          parts[2],
          DateTime.parse(parts[3]),
          double.parse(parts[4]),
          double.parse(parts[6]),
        )..isAvailable = parts[5] == 'true';
      } else if (parts[0] == 'bus') {
        return BusTicket(
          parts[1],
          parts[2],
          DateTime.parse(parts[3]),
          double.parse(parts[4]),
          parts[6],
        )..isAvailable = parts[5] == 'true';
      }
      throw Exception('Unknown ticket type');
    }).toList();
  }
}
