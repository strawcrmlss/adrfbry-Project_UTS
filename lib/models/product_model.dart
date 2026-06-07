class ProductModel {
  final String id;
  final String name;
  final int price;
  final String imageUrl;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  static List<ProductModel> sample() {
    return [
      ProductModel(
        id: '1',
        name: 'Laptop Gaming ASUS',
        price: 8500000,
        imageUrl:
            'https://images.unsplash.com/photo-1517336714739-489689fd1ca8',
        description: 'Laptop gaming performa tinggi',
      ),

      ProductModel(
        id: '2',
        name: 'Headset Wireless',
        price: 350000,
        imageUrl:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
        description: 'Headset suara jernih',
      ),

      ProductModel(
        id: '3',
        name: 'Mouse Gaming RGB',
        price: 150000,
        imageUrl:
            'https://images.unsplash.com/photo-1527814050087-3793815479db',
        description: 'Mouse gaming responsif',
      ),

      ProductModel(
        id: '4',
        name: 'Keyboard Mechanical',
        price: 450000,
        imageUrl:
            'https://images.unsplash.com/photo-1511467687858-23d96c32e4ae',
        description: 'Keyboard mechanical RGB',
      ),

      ProductModel(
        id: '5',
        name: 'Monitor 24 Inch',
        price: 1800000,
        imageUrl:
            'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf',
        description: 'Monitor Full HD',
      ),

      ProductModel(
        id: '6',
        name: 'Powerbank 20000mAh',
        price: 250000,
        imageUrl:
            'https://images.unsplash.com/photo-1609592806596-b43c0dd9483f',
        description: 'Powerbank fast charging',
      ),

      ProductModel(
        id: '7',
        name: 'Smartwatch',
        price: 500000,
        imageUrl:
            'https://images.unsplash.com/photo-1546868871-7041f2a55e12',
        description: 'Smartwatch multifungsi',
      ),

      ProductModel(
        id: '8',
        name: 'SSD 512GB',
        price: 650000,
        imageUrl:
            'https://images.unsplash.com/photo-1591488320449-011701bb6704',
        description: 'SSD kecepatan tinggi',
      ),

      ProductModel(
        id: '9',
        name: 'Speaker Bluetooth',
        price: 275000,
        imageUrl:
            'https://images.unsplash.com/photo-1545454675-3531b543be5d',
        description: 'Speaker bluetooth portable',
      ),

      ProductModel(
        id: '10',
        name: 'Webcam HD',
        price: 320000,
        imageUrl:
            'https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04',
        description: 'Webcam HD untuk meeting',
      ),

      ProductModel(
        id: '11',
        name: 'Tablet Android',
        price: 2500000,
        imageUrl:
            'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0',
        description: 'Tablet Android layar lebar',
      ),

      ProductModel(
        id: '12',
        name: 'Printer Wireless',
        price: 1450000,
        imageUrl:
            'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6',
        description: 'Printer wireless multifungsi',
      ),

      ProductModel(
        id: '13',
        name: 'Gaming Chair',
        price: 2200000,
        imageUrl:
            'https://images.unsplash.com/photo-1598550476439-6847785fcea6',
        description: 'Kursi gaming ergonomis',
      ),

      ProductModel(
        id: '14',
        name: 'Router WiFi',
        price: 480000,
        imageUrl:
            'https://images.unsplash.com/photo-1647427060118-4911c9821b82',
        description: 'Router WiFi kecepatan tinggi',
      ),

      ProductModel(
        id: '15',
        name: 'Microphone USB',
        price: 390000,
        imageUrl:
            'https://images.unsplash.com/photo-1516280440614-37939bbacd81',
        description: 'Microphone USB untuk streaming',
      ),

      ProductModel(
        id: '16',
        name: 'External Harddisk 1TB',
        price: 850000,
        imageUrl:
            'https://images.unsplash.com/photo-1531492746076-161ca9bcad58',
        description: 'Harddisk eksternal kapasitas besar',
      ),
    ];
  }
}