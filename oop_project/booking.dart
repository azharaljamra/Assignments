import 'ticket.dart';

class Booking {
  String _customerName;
  String _customerPhone;
  Ticket _ticket;

 
  Booking(this._customerName, this._customerPhone, this._ticket);

  
  String get customerName => _customerName;
  set customerName(String value) {
    _customerName = value;
  }


  String get customerPhone => _customerPhone;
  set customerPhone(String value) {
    _customerPhone = value;
  }





   Ticket get ticket => _ticket;
  set ticket(Ticket value) {
    _ticket = value;
  }


  }

