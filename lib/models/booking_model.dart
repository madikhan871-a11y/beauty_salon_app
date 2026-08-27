class BookingModel {
  final String id;
  final String serviceName;
  final String date;
  final String time;
  final double price;
  final String status;

  const BookingModel({
    required this.id,
    required this.serviceName,
    required this.date,
    required this.time,
    required this.price,
    required this.status,
  });
}