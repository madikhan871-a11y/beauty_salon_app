import '../models/salon_model.dart';
import '../models/service_model.dart';

class SalonService {
  static const List<SalonModel> salons = [
    SalonModel(
      id: '1',
      name: 'Beauty Bliss Salon',
      location: 'Main Boulevard',
      rating: 4.9,
      imageUrl:
      'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=900&q=80',
      description:
      'A modern beauty salon offering premium hair, skin and beauty services.',
    ),
    SalonModel(
      id: '2',
      name: 'Glow Beauty Studio',
      location: 'City Center',
      rating: 4.8,
      imageUrl:
      'https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?auto=format&fit=crop&w=900&q=80',
      description:
      'Relax, refresh and glow with our professional beauty services.',
    ),
    SalonModel(
      id: '3',
      name: 'Rose Beauty Lounge',
      location: 'Model Town',
      rating: 4.7,
      imageUrl:
      'https://images.unsplash.com/photo-1633681926027-7b6f5d2d5f44?auto=format&fit=crop&w=900&q=80',
      description:
      'A comfortable salon for your everyday and special occasion needs.',
    ),
  ];

  static const List<ServiceModel> services = [
    ServiceModel(
      id: '1',
      name: 'Hair Styling',
      category: 'Hair',
      duration: '45 min',
      price: 1800,
      icon: '✂️',
      description: 'Professional hair styling by our experienced stylists.',
    ),
    ServiceModel(
      id: '2',
      name: 'Hair Coloring',
      category: 'Hair',
      duration: '90 min',
      price: 3500,
      icon: '🎨',
      description: 'Give your hair a beautiful fresh color and shine.',
    ),
    ServiceModel(
      id: '3',
      name: 'Facial',
      category: 'Facial',
      duration: '60 min',
      price: 2500,
      icon: '✨',
      description: 'Relaxing facial treatment for fresh and glowing skin.',
    ),
    ServiceModel(
      id: '4',
      name: 'Manicure',
      category: 'Nails',
      duration: '40 min',
      price: 1200,
      icon: '💅',
      description: 'Complete manicure treatment with nail care.',
    ),
    ServiceModel(
      id: '5',
      name: 'Pedicure',
      category: 'Nails',
      duration: '50 min',
      price: 1500,
      icon: '🦶',
      description: 'Refreshing pedicure treatment for beautiful feet.',
    ),
    ServiceModel(
      id: '6',
      name: 'Makeup',
      category: 'Makeup',
      duration: '60 min',
      price: 3000,
      icon: '💄',
      description: 'Professional makeup for parties and special occasions.',
    ),
    ServiceModel(
      id: '7',
      name: 'Relaxing Spa',
      category: 'Spa',
      duration: '60 min',
      price: 2800,
      icon: '🌸',
      description: 'A relaxing spa experience to refresh your body and mind.',
    ),
  ];

  static List<SalonModel> getSalons() {
    return salons;
  }

  static List<ServiceModel> getServices() {
    return services;
  }
}