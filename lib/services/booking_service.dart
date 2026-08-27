import '../models/booking_model.dart';

class BookingService {
  static final List<BookingModel> _bookings = [];

  static List<BookingModel> get bookings => List.unmodifiable(_bookings);

  static void addBooking(BookingModel booking) {
    _bookings.insert(0, booking);
  }

  static void cancelBooking(String id) {
    final index = _bookings.indexWhere((booking) => booking.id == id);

    if (index != -1) {
      _bookings[index] = BookingModel(
        id: _bookings[index].id,
        serviceName: _bookings[index].serviceName,
        date: _bookings[index].date,
        time: _bookings[index].time,
        price: _bookings[index].price,
        status: 'Cancelled',
      );
    }
  }
}