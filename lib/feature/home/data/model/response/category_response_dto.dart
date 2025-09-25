import 'package:cartzy_app/feature/home/domain/entities/category_entity.dart';
class CategoryResponseDto {
  CategoryResponseDto({
    this.id,
    this.name,
    this.slug,
    this.image,
  });
  int? id;
  String? name;
  String? slug;
  String? image;

  CategoryResponseDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  CategoryEntity toEntity() => CategoryEntity(
        id: id ?? 0,
        name: name ?? "",
        slug: slug ?? "",
        image: image ?? "",
      );
}
