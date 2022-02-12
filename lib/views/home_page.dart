import 'package:flutter/material.dart';
import 'package:go_india_stocks/bloc/bulkBloc/bulk_bloc.dart';
import 'package:go_india_stocks/bloc/bulkBloc/bulk_event.dart';
import 'package:go_india_stocks/views/block_page.dart';
import 'package:go_india_stocks/views/bulk_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Go India Stocks",
          ),
          leading: Icon(Icons.arrow_back),
          backgroundColor: Colors.red,
        ),
        body: _buildListBulk(),

      
    );
  }
   Widget _buildListBulk(){
     return Container(
       child: DefaultTabController(
                      length: 2, // length of tabs
                      initialIndex: 0,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: Colors.blue,
                            unselectedLabelColor: Color(0xff858383),
                            tabs: [
                              Tab(text: "Bulk Deal"),
                              Tab(text: "Block Deal"),
                            ],
                          ),
                        ),
                        Container(
                           
                          height: MediaQuery.of(context).size.height*0.75,
                            decoration: BoxDecoration(
                              
                            ),
                            child: TabBarView(children: <Widget>[
                              Container(
                                child: BulkPage(),
                              ),
                              Container(
                                child: BlockPage(),
                              ),
                            ])
                        )
                      ])
                  ),

     );
   }

}