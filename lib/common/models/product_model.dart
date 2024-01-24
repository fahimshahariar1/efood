class ProductModel {
  int? totalSize;
  int? limit;
  int? offset;
  double? minPrice;
  double? maxPrice;
  List<String>? image;
  List<Product>? products;

  ProductModel({this.totalSize, this.limit, this.offset, this.products, this.maxPrice, this.minPrice});


  ProductModel.fromJson(Map<String, dynamic> json) {
    totalSize = int.tryParse('${json['total_size']}');
    minPrice = double.tryParse('${json['lowest_price']}') ?? 0;
    maxPrice = double.tryParse('${json['highest_price']}') ?? 0;
    limit = int.tryParse('${json['limit']}');
    offset = int.tryParse('${json['offset']}');
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = totalSize;
    data['limit'] = limit;
    data['offset'] = offset;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['highest_price'] = maxPrice;
    data['lowest_price'] = minPrice;
    return data;
  }
}

class Product {
  int? _id;
  String? _name;
  String? _description;
  dynamic _image;
  double? _price;
  List<Variation>? _variations;
  double? _tax;
  bool? _status;
  String? _createdAt;
  String? _updatedAt;
  List<String>? _attributes;
  List<CategoryId>? _categoryIds;
  List<ChoiceOption>? _choiceOptions;
  double? _discount;
  String? _discountType;
  String? _taxType;
  int? _wishlistCount;
  String? _unit;
  int? _totalStock;
  List<Rating>? _rating;

  Product(
      {int? id,
        String? name,
        String? description,
        List<String>? image,
        double? price,
        List<Variation>? variations,
        double? tax,
        bool? status,
        String? createdAt,
        String? updatedAt,
        List<String>? attributes,
        List<CategoryId>? categoryIds,
        List<ChoiceOption>? choiceOptions,
        double? discount,
        String? discountType,
        String? taxType,
        int? wishlistCount,
        String? unit,
        int? totalStock,
        List<Rating>? rating}) {
    _id = id;
    _name = name;
    _description = description;
    _image = image;
    _price = price;
    _variations = variations;
    _tax = tax;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _attributes = attributes;
    _categoryIds = categoryIds;
    _choiceOptions = choiceOptions;
    _discount = discount;
    _discountType = discountType;
    _taxType = taxType;
    _wishlistCount = wishlistCount;
    _unit = unit;
    _totalStock = totalStock;
    _rating = rating;
  }

  int? get id => _id;
  String? get name => _name;
  String? get description => _description;
  List<String>? get image {
    if (_image is List<String>) {
      return _image;
    } else if (_image is String) {
      return [_image];
    } else {
      return null;
    }
  }

  double? get price => _price;
  List<Variation>? get variations => _variations;
  double? get tax => _tax;
  bool? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<String>? get attributes => _attributes;
  List<CategoryId>? get categoryIds => _categoryIds;
  List<ChoiceOption>? get choiceOptions => _choiceOptions;
  double? get discount => _discount;
  String? get discountType => _discountType;
  String? get taxType => _taxType;
  int? get wishlistCount => _wishlistCount;
  String? get unit => _unit;
  int? get totalStock => _totalStock;
  List<Rating>? get rating => _rating;

  Product copyWith(int count){
    _wishlistCount = count;
    return this;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _price = json['price'].toDouble();
    if (json['variations'] != null) {
      _variations = [];
      json['variations'].forEach((v) {
        _variations!.add(Variation.fromJson(v));
      });
    }
    _tax = json['tax'].toDouble();
    _status = '${json['status']}'.contains('1');
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _attributes = json['attributes'].cast<String>();
    if (json['category_ids'] != null) {
      _categoryIds = [];
      json['category_ids'].forEach((v) {
        _categoryIds!.add(CategoryId.fromJson(v));
      });
    }
    if (json['choice_options'] != null) {
      _choiceOptions = [];
      json['choice_options'].forEach((v) {
        _choiceOptions!.add(ChoiceOption.fromJson(v));
      });
    }
    _discount = json['discount'].toDouble();
    _discountType = json['discount_type'];
    _taxType = json['tax_type'];
    _wishlistCount = json['wishlist_count'];
    _unit = json['unit'];
    _totalStock = json['total_stock'];
    if (json['rating'] != null) {
      _rating = [];
      json['rating'].forEach((v) {
        _rating!.add(Rating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['description'] = _description;
    data['image'] = _image;
    data['price'] = _price;
    if (_variations != null) {
      data['variations'] = _variations!.map((v) => v.toJson()).toList();
    }
    data['tax'] = _tax;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['attributes'] = _attributes;
    if (_categoryIds != null) {
      data['category_ids'] = _categoryIds!.map((v) => v.toJson()).toList();
    }
    if (_choiceOptions != null) {
      data['choice_options'] =
          _choiceOptions!.map((v) => v.toJson()).toList();
    }
    data['discount'] = _discount;
    data['discount_type'] = _discountType;
    data['tax_type'] = _taxType;
    data['wishlist_count'] = _wishlistCount;
    data['unit'] = _unit;
    data['total_stock'] = _totalStock;
    if (_rating != null) {
      data['rating'] = _rating!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variation {
  String? _type;
  double? _price;
  int? _stock;

  Variation({String? type, double? price, int? stock}) {
    _type = type;
    _price = price;
    _stock = stock;
  }

  String? get type => _type;
  double? get price => _price;
  int? get stock => _stock;

  Variation.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    if(json['price'] != null) {
      _price = json['price'].toDouble();
    }
    _stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['price'] = _price;
    data['stock'] = _stock;
    return data;
  }
}

class CategoryId {
  String? _id;

  CategoryId({String? id}) {
    _id = id;
  }

  String? get id => _id;

  CategoryId.fromJson(Map<String, dynamic> json) {
    _id = json['id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    return data;
  }
}

class ChoiceOption {
  String? _name;
  String? _title;
  List<String>? _options;

  ChoiceOption({String? name, String? title, List<String>? options}) {
    _name = name;
    _title = title;
    _options = options;
  }

  String? get name => _name;
  String? get title => _title;
  List<String>? get options => _options;

  ChoiceOption.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _title = json['title'];
    _options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['title'] = _title;
    data['options'] = _options;
    return data;
  }
}

class Rating {
  String? _average;
  int? _productId;

  Rating({String? average, int? productId}) {
    _average = average;
    _productId = productId;
  }

  String? get average => _average;
  int? get productId => _productId;

  Rating.fromJson(Map<String, dynamic> json) {
    _average = json['average'];
    _productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['average'] = _average;
    data['product_id'] = _productId;
    return data;
  }
}

class PriceRange{
  final double? startPrice;
  final double? endPrice;

  PriceRange({required this.startPrice, required this.endPrice});
}