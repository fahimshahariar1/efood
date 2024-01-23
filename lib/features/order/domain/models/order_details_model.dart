

class OrderDetailsModel {
  int? totalSize;
  int? limit;
  int? offset;
  List<Products>? products;

  OrderDetailsModel({this.totalSize, this.limit, this.offset, this.products});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  String? image;
  int? price;
  List<Variations>? variations;
  List<AddOns>? addOns;
  double? tax;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<Null>? attributes;
  List<CategoryIds>? categoryIds;
  List<Null>? choiceOptions;
  int? discount;
  String? discountType;
  String? taxType;
  int? setMenu;
  int? popularityCount;
  String? productType;
  BranchProduct? branchProduct;
  List<Rating>? rating;

  Products(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.price,
        this.variations,
        this.addOns,
        this.tax,
        this.availableTimeStarts,
        this.availableTimeEnds,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.attributes,
        this.categoryIds,
        this.choiceOptions,
        this.discount,
        this.discountType,
        this.taxType,
        this.setMenu,
        this.popularityCount,
        this.productType,
        this.branchProduct,
        this.rating});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    if (json['add_ons'] != null) {
      addOns = <AddOns>[];
      json['add_ons'].forEach((v) {
        addOns!.add(new AddOns.fromJson(v));
      });
    }
    tax = json['tax'];
    availableTimeStarts = json['available_time_starts'];
    availableTimeEnds = json['available_time_ends'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['attributes'] != null) {
      attributes = <Null>[];
      json['attributes'].forEach((v) {
        //attributes!.add(new Null.fromJson(v));
      });
    }
    if (json['category_ids'] != null) {
      categoryIds = <CategoryIds>[];
      json['category_ids'].forEach((v) {
        categoryIds!.add(new CategoryIds.fromJson(v));
      });
    }
    if (json['choice_options'] != null) {
      choiceOptions = <Null>[];
      json['choice_options'].forEach((v) {
       // choiceOptions!.add(new Null.fromJson(v));
      });
    }
    discount = json['discount'];
    discountType = json['discount_type'];
    taxType = json['tax_type'];
    setMenu = json['set_menu'];
    popularityCount = json['popularity_count'];
    productType = json['product_type'];
    branchProduct = json['branch_product'] != null
        ? new BranchProduct.fromJson(json['branch_product'])
        : null;
    if (json['rating'] != null) {
      rating = <Rating>[];
      json['rating'].forEach((v) {
        rating!.add(new Rating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    if (this.addOns != null) {
      data['add_ons'] = this.addOns!.map((v) => v.toJson()).toList();
    }
    data['tax'] = this.tax;
    data['available_time_starts'] = this.availableTimeStarts;
    data['available_time_ends'] = this.availableTimeEnds;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.attributes != null) {
      //data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    if (this.categoryIds != null) {
      data['category_ids'] = this.categoryIds!.map((v) => v.toJson()).toList();
    }
    // if (this.choiceOptions != null) {
    //   data['choice_options'] =
    //       this.choiceOptions!.map((v) => v.toJson()).toList();
    // }
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['tax_type'] = this.taxType;
    data['set_menu'] = this.setMenu;
    data['popularity_count'] = this.popularityCount;
    data['product_type'] = this.productType;
    if (this.branchProduct != null) {
      data['branch_product'] = this.branchProduct!.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variations {
  String? name;
  String? type;
  int? min;
  int? max;
  String? required;
  List<Values>? values;

  Variations(
      {this.name, this.type, this.min, this.max, this.required, this.values});

  Variations.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    min = json['min'];
    max = json['max'];
    required = json['required'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['min'] = this.min;
    data['max'] = this.max;
    data['required'] = this.required;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  String? label;
  String? optionPrice;

  Values({this.label, this.optionPrice});

  Values.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    optionPrice = json['optionPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['optionPrice'] = this.optionPrice;
    return data;
  }
}

class AddOns {
  int? id;
  String? name;
  int? price;
  int? tax;
  String? createdAt;
  String? updatedAt;
  List<Null>? translations;

  AddOns(
      {this.id,
        this.name,
        this.price,
        this.tax,
        this.createdAt,
        this.updatedAt,
        this.translations});

  AddOns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    tax = json['tax'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['translations'] != null) {
      translations = <Null>[];
      json['translations'].forEach((v) {
        //translations!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['tax'] = this.tax;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    // if (this.translations != null) {
    //   data['translations'] = this.translations!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class CategoryIds {
  String? id;
  int? position;

  CategoryIds({this.id, this.position});

  CategoryIds.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['position'] = this.position;
    return data;
  }
}

class BranchProduct {
  int? id;
  int? productId;
  int? price;
  String? discountType;
  int? discount;
  int? branchId;
  int? isAvailable;
  List<Variations>? variations;
  String? createdAt;
  String? updatedAt;
  String? stockType;
  int? stock;
  int? soldQuantity;

  BranchProduct(
      {this.id,
        this.productId,
        this.price,
        this.discountType,
        this.discount,
        this.branchId,
        this.isAvailable,
        this.variations,
        this.createdAt,
        this.updatedAt,
        this.stockType,
        this.stock,
        this.soldQuantity});

  BranchProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    discountType = json['discount_type'];
    discount = json['discount'];
    branchId = json['branch_id'];
    isAvailable = json['is_available'];
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stockType = json['stock_type'];
    stock = json['stock'];
    soldQuantity = json['sold_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['price'] = this.price;
    data['discount_type'] = this.discountType;
    data['discount'] = this.discount;
    data['branch_id'] = this.branchId;
    data['is_available'] = this.isAvailable;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['stock_type'] = this.stockType;
    data['stock'] = this.stock;
    data['sold_quantity'] = this.soldQuantity;
    return data;
  }
}

class Rating {
  String? average;
  int? productId;

  Rating({this.average, this.productId});

  Rating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['product_id'] = this.productId;
    return data;
  }
}
