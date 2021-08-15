import 'package:hive/hive.dart';
part 'films_adapter.g.dart';
@HiveType(typeId : 1)
class Film{
  @HiveField(0)
  String title;
  @HiveField(1)
  String director;
Film({this.title,this.director});

}