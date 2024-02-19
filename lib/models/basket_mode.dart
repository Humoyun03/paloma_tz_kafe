class BasketModel{
  String items;
  String name;
  int isPay;
  int price;

  BasketModel({required this.items,required this.name,required this.isPay,required this.price});

  BasketModel.fromMap(Map<dynamic, dynamic> item):
        items=item["items"], name= item["name"], isPay= item["isPay"], price= item["price"];

  Map<String, dynamic> toMap(){
    return {'items':items,'name': name,'isPay':isPay,'price': price};
  }
}

enum Payment{
  payed,noPayed,payedProcess
}