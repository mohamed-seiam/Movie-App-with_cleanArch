import 'package:movies_app/domain/entities/sections_entity.dart';

class Sections {
  const Sections._();

  static const sections = [
    SectionsEntity(name: 'Trending', value: 0),
    SectionsEntity(name: 'Popular', value: 1),
    SectionsEntity(name: 'Now', value: 2),
    SectionsEntity(name: 'Soon', value: 3),
  ];
}
