import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_stocks/bloc/bulkBloc/bulk_bloc.dart';
import 'package:go_india_stocks/bloc/bulkBloc/bulk_event.dart';
import 'package:go_india_stocks/bloc/bulkBloc/bulk_state.dart';
import 'package:go_india_stocks/models/bulkdeal_model.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List results = [];
   var rows = [];
  String query = '';
  late TextEditingController tc;
   final BulkBloc _bulkBloc =BulkBloc();
 

  @override
  void initState() {
    super.initState();
    tc = TextEditingController();
    _bulkBloc.add(GetBulkList());
    final mList=_bulkBloc.add(GetBulkList());
   
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: tc,
                    decoration: InputDecoration(hintText: 'Search...'),
                    onChanged: (v) {
                      setState(() {
                        query = v;
                        setResults(query);
                      });
                    },
                  ),
                ),
                  BlocProvider(
                      create: (_) => _bulkBloc,
                      child: BlocListener<BulkBloc,BulkState>(
                        listener: (context, state) {
                          if (state is BulkError){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(state.message!),
                            )
                            );
                          }                    
                      },
                      child: BlocBuilder<BulkBloc,BulkState>(builder: (context, state){
                        if(state is BulkInitial){
                          return _buildLoading();
                        } else if (state is BulkLoading){
                          return _buildLoading();
                        } else if (state is BulkLoaded){
                          return _buildCard(context,state.bulkdealModel);
                        } else if (state is BulkError){
                          return Container();
                        } else {
                          return Container();
                        }
                      },),
                    )
                  ),
               
              ],
            ),
          ],
        ),
      ),
    );
      
  
  }
  

   void setResults(String query) {
    results = rows
        .where((elem) =>
            elem['Data']['ClientName']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) 
            )
        .toList();
  }
  Widget _buildCard(BuildContext context, BulkdealModel model) {
    return  Container(
                  color: Colors.white,
                  child: query.isEmpty
                      ? Container()/*ListView.builder(
                          shrinkWrap: true,
                          itemCount: model.data!.length,
                          itemBuilder: (con, index) {
                            return ListTile(
                              title: Text("${model.data![index].clientName}"),
                             
                            );
                          },
                        )*/
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: results.length,
                          itemBuilder: (con, index) {
                            return ListTile(
                              title: Text("${model.data![index].clientName}"),
                            
                            );
                          },
                        ),
                );
  }
   Widget _buildLoading() => Center(child: CircularProgressIndicator(),);
  
}