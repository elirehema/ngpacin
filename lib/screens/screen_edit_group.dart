import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobile/screens/index.dart';
import 'package:mobile/utils/colors.dart';

class ScreenEditGroupGroup extends StatefulWidget {
  @override
  _ScreenEditGroupGroupState createState() => _ScreenEditGroupGroupState();
}

class _ScreenEditGroupGroupState extends State<ScreenEditGroupGroup> {
  bool _isDescriptionNotNeeded = true;
  final description = TextEditingController();
  final amountToStartController = TextEditingController();
  final groupNameController = TextEditingController();
  var values = {'1,000', '2,000', '5,000', '10,000'};


  @override
  void dispose() {
    description.dispose();
    super.dispose();
  }
  void _onItemTapped() {
    setState(() {
      _isDescriptionNotNeeded = !_isDescriptionNotNeeded;
    });
  }
  void _selectAmount(String value) {
    setState(() {
      amountToStartController.text = value;
      groupNameController.text = 'Birthday of kwalima twins';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorAccent,
      appBar: AppBar(

        title: Text('Edit group details'),
        backgroundColor: colorPrimary,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: EdgeInsets.all(10.0),
        child: Card(
            elevation: 1,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: StatefulBuilder(
                builder: (context, setState){
                  return _isDescriptionNotNeeded ?  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Text('Group name'),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          maxLength: 36,
                          controller: groupNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Group name'),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        //Text('Amount to start'),
                        TextField(
                          controller: amountToStartController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Amount to start',
                              hintText: '1000.0'),
                        ),
                        SizedBox(height: 30.0,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: values.map((text) => GestureDetector(
                              onTap: (){
                                _selectAmount(text);
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      side: amountToStartController.text == text ?  BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ): BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0)
                                  ),
                                  elevation: 0.8,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Text(
                                        '$text \n TZS',
                                        textAlign: TextAlign.center,
                                        textScaleFactor: 1.2,
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                  )
                              ),
                            )
                            ).toList()
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        ListTile(
                          dense: true,
                          title: Text(description.text.isNotEmpty ? description.text : 'Add description'),
                          trailing: Icon(MdiIcons.chevronRight, size: 36.0,),
                          onTap: _onItemTapped,
                        )
                      ],
                    ),
                  ) :
                  Padding(padding: EdgeInsets.all(10.0),
                    child: Expanded(
                      child:TextField(
                        maxLength: 100,
                        maxLines: null,
                        controller: description,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Lorem ipsum ....',
                            labelText: 'Description'),
                        keyboardType: TextInputType.multiline,
                      ),),);
                },
              ),
              bottomNavigationBar: BottomAppBar(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child:  _isDescriptionNotNeeded ? ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,    MaterialPageRoute(builder: (context) => new ScreenCashOutApprovers()));
                    },
                    child: Text('Continue' ,style: TextStyle(color:  Colors.white)),
                  ): ElevatedButton(onPressed:   _onItemTapped, child: Text( 'Add', style: TextStyle(color:  Colors.white)),),
                ),
                elevation: 0,
              ),
            )
        ),

      ),

    );
  }
}
