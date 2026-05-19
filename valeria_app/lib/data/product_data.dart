import '../models/product.dart';

final List<Product> products = [
  Product(
    id: "rose_essence",
    name: "Rose Essence",
    price: "\$145",
    category: "Women",
    image: "assets/images/product1.jpg",
    description:
        "A luxurious floral fragrance that blends rose petals with soft vanilla undertones for a timeless elegant scent.",
    notes: ["Rose", "Vanilla", "Peony", "Musk"],
  ),
  Product(
    id: "royal_bloom",
    name: "Royal Bloom",
    price: "\$120",
    category: "Women",
    image: "assets/images/product2.jpg",
    description:
        "A royal-inspired fragrance that captures the essence of blooming gardens at sunrise.",
    notes: ["Jasmine", "Orange Blossom", "Amber"],
  ),
  Product(
    id: "velvet_night",
    name: "Velvet Night",
    price: "\$160",
    category: "Men",
    image: "assets/images/product3.jpg",
    description:
        "A deep and sensual fragrance designed for evening elegance and confidence.",
    notes: ["Leather", "Wood", "Spice", "Musk"],
  ),
  Product(
    id: "golden_aura",
    name: "Golden Aura",
    price: "\$180",
    category: "Luxury",
    image: "assets/images/product4.jpg",
    description:
        "A rich luxury fragrance that embodies warmth, gold tones, and refined sophistication.",
    notes: ["Amber", "Saffron", "Vanilla", "Oud"],
  ),
];