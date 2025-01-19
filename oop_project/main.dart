import 'bus_ticket.dart';
import 'ticket.dart';
import 'booking.dart';
import 'plane_ticket.dart';
import 'ticket_manager.dart';
import 'booking_manager.dart';


void main() async {
  var ticketManager = TicketManager('tickets.txt');
  var bookingManager = BookingManager('bookings.txt');

  
  var planeTicket = PlaneTicket(
      'Cairo', 'Dubai', DateTime.now().add(Duration(hours: 5)), 150.0, 30.0);
  var busTicket = BusTicket('Alexandria', 'Cairo',
      DateTime.now().add(Duration(hours: 3)), 50.0, 'A1');
  await ticketManager.saveTicket(planeTicket);
  await ticketManager.saveTicket(busTicket);

    var tickets = await ticketManager.loadTickets();
  tickets.where((ticket) => ticket.isAvailable).forEach((ticket) {
    ticket.displayDetails();
  });

 
  var selectedTicket = tickets.first;
  var booking = Booking('John Doe', '123456789', selectedTicket);
  await bookingManager.addBooking(booking);

   
  var totalBookings = await bookingManager.getTotalBookings();
  var totalRevenue = await bookingManager.getTotalRevenue();
  print('Total Bookings: $totalBookings, Total Revenue: $totalRevenue');
}
