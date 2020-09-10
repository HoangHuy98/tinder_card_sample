import 'package:sembast/sembast.dart';

abstract class BaseModel{
  Future insertModel(Map<String, dynamic> map);
  Future insertModelAll(List<Map<String, dynamic>> mapList);
  Future getModel();
  Future getModelWithCondition(Finder finder);
  Future updateModel(Finder finder, Map<String, dynamic> map);
  Future updateModelAll(Map<String, dynamic> map);
  Future deleteModel(Finder finder);
  Future deleteModelAll();
}