import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paloma_tz_kafe/presentation/components/table_item.dart';
import 'package:paloma_tz_kafe/presentation/pages/basket_page.dart';

import 'sales_mode_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  PageController pageController = PageController();

  void changeIndex(index){
    Navigator.pop(context);
    setState(() {
      pageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(pageIndex==0?"Кассир":pageIndex==1?"Выбор":pageIndex==2?"Режим продаж":"Склад"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Мавлонов Хумоюн",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.blue,fontSize: 22),),
                    Text("программист",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.blue),),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.sync,
                  color: Colors.blue.shade800,
                ),
                title: Text("Синхронизация"),
                subtitle: Text("06.10.2003 22:22"),
              ),
              ListTile(
                onTap: (){
                  changeIndex(0);
                  pageController.jumpToPage(0);
                },
                leading: Icon(
                  Icons.calculate,
                  color: Colors.blue.shade800,
                ),
                title: Text("Кассир"),
              ),
              ListTile(
                onTap: (){
                  changeIndex(1);
                  pageController.jumpToPage(1);
                },
                leading: Icon(
                  Icons.accessibility_outlined,
                  color: Colors.blue.shade800,
                ),
                title: Text("Официанты"),
              ),
              ListTile(
                onTap: (){
                  changeIndex(2);
                  pageController.jumpToPage(2);
                },
                leading: Icon(
                  Icons.local_mall_outlined,
                  color: Colors.blue.shade800,
                ),
                title: Text("Режим продажи"),
              ),
              ListTile(
                onTap: (){
                },
                leading: Icon(
                  Icons.warehouse,
                  color: Colors.blue.shade800,
                ),
                title: Text("Склад"),
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.blue.shade800,
                ),
                title: Text("Сменить сотрудника"),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          BasketPage(),
          Scaffold(
            body: Column(
              children: [
                SizedBox(height: 20,),
                const Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: Row(
                    children: [
                      DishWidget(title: "основной зал"),
                      SizedBox(
                        width: 10,
                      ),
                      DishWidget(title: "летка"),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.yellow.shade100
                                ),
                                child: Icon(Icons.receipt,color: Colors.indigoAccent,),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Vip 1",
                                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: double.infinity,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue.shade100
                                ),
                                child: Icon(Icons.print_outlined,color: Colors.indigoAccent,),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "Vip 2",
                                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SalesModePage(),
          Scaffold(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}