class TopProducts {
  final String brand;
  final String name;
  final String image;
  final String desc;
  final String long;

  TopProducts(
      {required this.brand,
      required this.name,
      required this.image,
      required this.desc,
      required this.long});
}

var TopProductsList = [
  TopProducts(
      image: 'assets/image/ordinary.png',
      brand: 'The Ordinary',
      name: 'Granactive Retinotoid',
      desc: 'This water-free solution contains a 5% concentration of retinoid.',
      long:
          "This water-free solution is formulated with a potent 5% concentration of retinoid, a renowned skincare ingredient known for its exceptional ability to promote skin renewal and improve the appearance of fine lines and wrinkles. This product is designed to enhance your skin's overall texture and radiance."),
  TopProducts(
      image: 'assets/image/nutrishe.png',
      brand: 'Nutrishe',
      name: 'Intensive Bright & Glow Serum',
      desc: 'Fades dark spots, evens tone, and adds a luminous glow.',
      long:
          "This extraordinary formula effectively fades dark spots, promoting an even skin tone while imparting a radiant and luminous glow. Its powerful blend of ingredients targets hyperpigmentation, leaving your complexion visibly brighter and more radiant."),
  TopProducts(
      image: 'assets/image/tific.png',
      brand: 'Skintific',
      name: 'Daily Repair Moisturize Gel',
      desc:
          'Contained 7x Ceramide Lightweight, non-greasy, and deeply hydrating.',
      long:
          'Enriched with seven times the goodness of ceramides, this lightweight and non-greasy moisturizer provides deep and lasting hydration to your skin. It locks in moisture, strengthens the skin barrier, and leaves your complexion feeling soft, supple, and perfectly balanced.'),
  TopProducts(
      image: 'assets/image/cetaphil.png',
      brand: 'Cetaphil',
      name: 'Gentle Skin Cleanser',
      desc:
          'Removes impurities without stripping skin. A daily ritual for clean skin.',
      long:
          'Gently eliminating impurities without causing any harm or stripping essential moisture from your skin, this product has become a daily essential for maintaining a clean, refreshed complexion. It effectively purifies your skin, leaving it feeling revitalized and ready for your daily skincare routine.'),
  TopProducts(
      image: 'assets/image/somethinc.png',
      brand: 'Somethinc',
      name: 'AHA BHA Peeling Solution',
      desc: 'Powered by natural extracts, serum revitalizes with AHA, BHA',
      long:
          'Harnessing the revitalizing power of natural extracts, this serum is enriched with AHA (Alpha Hydroxy Acid) and BHA (Beta Hydroxy Acid). It effectively exfoliates and renews the skin, promoting a more youthful and radiant complexion.'),
];
