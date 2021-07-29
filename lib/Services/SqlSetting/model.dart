class SettingModel{
  int? _id;
  String? _name, _imgUrl;

  SettingModel(dynamic obj){
    _id = obj['id'];
    _name = obj['name'];
    _imgUrl = obj['imgUrl'];
  }
  SettingModel.fromMap(Map<String, dynamic> data){
    _id = data['id'];
    _name = data['name'];
    _imgUrl = data['imgUrl'];
  }
  Map<String, dynamic> toMap() => {'id' : _id, 'name': _name,'imgUrl' : _imgUrl,};

  int? get id => _id;
  String? get name => _name;
  String? get imgUrl => _imgUrl;
}