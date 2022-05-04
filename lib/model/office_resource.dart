import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'office_resource.g.dart';
abstract class OfficeResource implements Built<OfficeResource, OfficeResourceBuilder> {
  int get officeId;
  int get  resourceId;

  OfficeResource._();
  factory OfficeResource([updates(OfficeResourceBuilder b)]) = _$OfficeResource;

  static Serializer<OfficeResource> get serializer => _$officeResourceSerializer;
}