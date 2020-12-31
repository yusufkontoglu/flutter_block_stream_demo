List<int> exampleList = [3,3,3,3];

class ListService{

  static void changeList(int value){
    if(value == 0){
      exampleList = [1,1,1,1];
    }else{
      exampleList = [2,2,2,2];
    }
  }

  static List getList(){
    return exampleList;
  }
}