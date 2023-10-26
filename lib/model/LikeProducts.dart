class LikeProducts {
  final String brand;
  final String name;
  final String image;
  final String desc;
  final String long;

  LikeProducts({
    required this.brand,
    required this.name,
    required this.image,
    required this.desc,
    required this.long,
  });
}

var LikeProductsList = [
  LikeProducts(
    image: 'assets/image/npure.png',
    brand: 'Npure',
    name: 'Npure Centella Asiatica Toner',
    desc:
        'A soothing and hydrating toner enriched with Centella Asiatica extract.',
    long:
        "Npure Centella Asiatica Toner is a soothing and hydrating toner enriched with Centella Asiatica extract. It helps calm and moisturize your skin while providing relief to irritated or sensitive skin. Incorporate it into your skincare routine for a refreshing and revitalizing experience.",
  ),
  LikeProducts(
      image: 'assets/image/skintific-pink.png',
      brand: 'Skintific',
      name: 'Niacinamide Moisturizer',
      desc:
          'A lightweight moisturizer with niacinamide to improve skin texture.',
      long:
          "Skintific Niacinamide Moisturizer is a lightweight and non-greasy moisturizer that contains niacinamide, known for its ability to improve skin texture and minimize the appearance of pores. It's suitable for daily use and leaves your skin feeling smooth and refreshed."),
  LikeProducts(
      image: 'assets/image/azarine.png',
      brand: 'Azarine',
      name: 'Sunscreen Moisturizer',
      desc: 'A dual-action sunscreen and moisturizer for daily sun protection.',
      long:
          "Azarine Sunscreen Moisturizer is a dual-action product that combines sunscreen and moisturizer in one. It provides broad-spectrum sun protection while keeping your skin hydrated and nourished. Incorporate it into your daily skincare routine to shield your skin from harmful UV rays."),
  LikeProducts(
      image: 'assets/image/cosrx-aha.png',
      brand: 'Cosrx',
      name: 'Cosrx AHA BHA Clarifying Toner',
      desc: 'An exfoliating and clarifying toner to improve skin texture.',
      long:
          "Cosrx AHA BHA Clarifying Toner is an exfoliating and clarifying toner designed to improve skin texture and promote a smoother complexion. It contains alpha hydroxy acids (AHA) and beta hydroxy acids (BHA) that help remove dead skin cells and unclog pores. Incorporate it into your skincare routine for a more refined and radiant skin."),
  LikeProducts(
    image: 'assets/image/cosrx-morning.png',
    brand: 'Cosrx',
    name: 'Morning Cleanser',
    desc:
        'A gentle and refreshing daily cleanser to kickstart your skincare routine.',
    long:
        "Cosrx Morning Cleanser is a gentle and refreshing daily cleanser that's perfect for starting your skincare routine. It effectively removes impurities and excess oil while maintaining your skin's natural moisture balance. With a low pH formula, it helps protect your skin's barrier and leaves your skin feeling clean and hydrated.",
  )
];
