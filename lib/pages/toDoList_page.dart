import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
 
 
class ToDOListPage extends StatefulWidget {
  static final String routeName = 'toDo';

  @override
  _ToDOListPageState createState() => _ToDOListPageState();
}

class _ToDOListPageState extends State<ToDOListPage> {
  CalendarController _controller;
 
  TextStyle dayStyle ( FontWeight fontWeight){
    return new TextStyle(
         color: new Color(0xff30384c),
         fontWeight: fontWeight
    );
  }

  @override
  void initState() { 
    super.initState();
    _controller = new CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Calendario de Actividades'),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          child: new Column(children: [
            _crearCalendario()
          ],)
        )
    );
  }

 Widget _crearCalendario() {
   List hola =['hola','como'];
   return new TableCalendar(
     calendarController: _controller,
     calendarStyle: new CalendarStyle(
       weekdayStyle: dayStyle(FontWeight.normal),
       weekendStyle: dayStyle(FontWeight.normal),
      // selectedColor: 
     ),
     onDaySelected: (day, events) {
       events = hola;
       print(day);
     },
     
  );
 }
}