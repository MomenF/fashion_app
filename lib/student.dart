class Student{
  String? _name ;
  int?  _age ;

void setAge(int value){
  if(value > 10 ){
    _age = value;
  } else{
    throw Exception("the Age must be more than 10");
  }
}

int? getAge(){
  print(_age);
  return _age;
}

void info(){
  print("thw name is ${_name} the age is ${_age}");
}

}