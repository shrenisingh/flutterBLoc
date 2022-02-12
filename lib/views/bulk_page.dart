import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_india_stocks/bloc/bulkBloc/bulk_bloc.dart';
import 'package:go_india_stocks/bloc/bulkBloc/bulk_event.dart';

import 'package:go_india_stocks/bloc/bulkBloc/bulk_state.dart';
import 'package:go_india_stocks/models/bulkdeal_model.dart';
import 'package:go_india_stocks/views/search_page.dart';
import 'package:go_india_stocks/views/widgets/custom_button.dart';
import 'package:go_india_stocks/views/widgets/custom_searchbar.dart';
class BulkPage extends StatefulWidget {
  const BulkPage({ Key? key }) : super(key: key);

  @override
  _BulkPageState createState() => _BulkPageState();
}

class _BulkPageState extends State<BulkPage> {
  
  final BulkBloc _bulkBloc =BulkBloc();
  @override
  void initState() {
    _bulkBloc.add(GetBulkList());
    super.initState();
    
  }
  late int i=0;
  @override
  Widget build(BuildContext context) {
    return Container(
       height: MediaQuery.of(context).size.height*0.99,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Container(
           height: MediaQuery.of(context).size.height*0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            CustomButton(buttonName: "All",
            onPressed: (){
              i=1;
              
              _bulkBloc.add(GetBulkList());
            },
            color: MaterialStateProperty.all<Color>(Colors.blue),),
            CustomButton(buttonName: "Buy",
            onPressed: (){
              i=2;
               _bulkBloc.add(GetBulkList());
              

            },
            color: MaterialStateProperty.all<Color>(Colors.green),),
            CustomButton(buttonName: "Sell",
            onPressed: (){
              i=3;
              _bulkBloc.add(GetBulkList());
            },
            color: MaterialStateProperty.all<Color>(Colors.red),)
          ],),
        ),
        Container(
           height: MediaQuery.of(context).size.height*0.05,
          child: CustomSearchBar(
            onPressed: (){
               Navigator.push(context,
      MaterialPageRoute(builder: (context) => SearchPage()));
            },
          ),
        ),
            // ignore: avoid_unnecessary_containers
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
        
      ],),
      
      
    );
  }
 
   Widget _buildCard(BuildContext context, BulkdealModel model) {
     return Container(
       height: MediaQuery.of(context).size.height*0.58,
       
       child: ListView.builder(
         itemCount: model.data!.length,
         itemBuilder: (context, index){
           String bigName = model.data![index].clientName.toString();
           bigName.split(" ").sublist(0, 3).join(" ");
          
           if(i==1 || i==0){
           return Card(
             shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
                    child: Container(
                      
                       padding: EdgeInsets.only(left: 15,top: 15,bottom: 15,right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              
                                  Text("${model.data![index].clientName}".split(" ").sublist(0, 3).join(" "),
                                  
                                  style: TextStyle(fontSize: 12,
                                  fontWeight: FontWeight.bold),),
                             
                            
                                  Text(DateTime.parse("${model.data![index].dealDate}").toString().split(' ')[0],
                                  style: TextStyle(fontSize: 12,),),
                                  
                                
                            ],
                          ),
                          (model.data![index].dealType =='BUY') ?
                           Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                           
                            
                            child: Text("${model.data![index].dealType} ${model.data![index].quantity} shares @ Rs. ${model.data![index].tradePrice}",
                            style: TextStyle(color: Colors.green,
                            fontWeight: FontWeight.bold),)):
                            Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                            
                            
                            child: Text("${model.data![index].dealType} ${model.data![index].quantity} shares @ Rs. ${model.data![index].tradePrice}",
                            style: TextStyle(color: Colors.red,
                            fontWeight: FontWeight.bold),)),

                            Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                           
                            
                            child: Text("Value Rs. ${model.data![index].value} cr",
                            style: TextStyle(color: Colors.blue,
                            fontWeight: FontWeight.bold),))
                          
                        ],
                
                      ),
                    ),
                  );
           }else if(i==2){
             if(model.data![index].dealType =='BUY'){
               return Card(
                    child: Container(
                       padding: EdgeInsets.only(left: 5,top: 15,bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text("${model.data![index].clientName}".split(" ").sublist(0, 3).join(" "),
                                  
                                  style: TextStyle(fontSize: 12,
                                  fontWeight: FontWeight.bold),),
                             
                             
                                   Text(DateTime.parse("${model.data![index].dealDate}").toString().split(' ')[0],
                                  style: TextStyle(fontSize: 12,),),
                                
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                           
                            child: Text("${model.data![index].dealType} ${model.data![index].quantity} shares @ Rs. ${model.data![index].tradePrice}",
                            style: TextStyle(color: Colors.green,
                            fontWeight: FontWeight.bold),)),
                            Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                           
                            
                            child: Text("Value Rs. ${model.data![index].value} cr",
                            style: TextStyle(color: Colors.blue,
                            fontWeight: FontWeight.bold),))
                          
                        ],
                
                      ),
                    ),
                  );

             }
             else {
               return Container();
             }
           }
           else {
             if(model.data![index].dealType =='SELL'){
               return Card(
                    child: Container(
                       padding: EdgeInsets.only(left: 5,top: 15,bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text("${model.data![index].clientName}".split(" ").sublist(0, 3).join(" "),
                                  
                                  style: TextStyle(fontSize: 12,
                                  fontWeight: FontWeight.bold),),
                             
                             
                                 Text(DateTime.parse("${model.data![index].dealDate}").toString().split(' ')[0],
                                  style: TextStyle(fontSize: 12,),),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                          
                            
                            child: Text("${model.data![index].dealType} ${model.data![index].quantity} shares @ Rs. ${model.data![index].tradePrice}",
                            style: TextStyle(color: Colors.red,
                            fontWeight: FontWeight.bold),)),
                            Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                           
                            
                            child: Text("Value Rs. ${model.data![index].value} cr",
                            style: TextStyle(color: Colors.blue,
                            fontWeight: FontWeight.bold),))
                          
                        ],
                
                      ),
                    ),
                  );

             }
             else {
               return Container();
             }
             
             
           }

         }),
     );
  }
   Widget _buildLoading() => Center(child: CircularProgressIndicator(),);
}