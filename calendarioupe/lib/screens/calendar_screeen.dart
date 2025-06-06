import 'dart:collection';

import 'package:calendarioupe/models/event_model.dart';
import 'package:calendarioupe/utils/faker_api.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendarioupe/components/my_decoration.dart';



LinkedHashMap<DateTime, List<AppEvent>>? _groupedEvents;


class CalendarScreeen extends StatefulWidget {
  const CalendarScreeen({super.key});

  @override
  State<CalendarScreeen> createState() => _CalendarScreeenState();
}


List<AppEvent> events = [];

class _CalendarScreeenState extends State<CalendarScreeen> {

  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }



@override
void initState(){
   addSchedules();

}

List<dynamic> _getEventsForDay(DateTime date){
  return _groupedEvents?[date] ?? [];
}

Future addSchedules() async{
  await FakerApi.getData().then((schedules){
    for (var i=0; i< schedules.length; i++){
      events.add(AppEvent(
        date: DateTime.parse(schedules[i].birthday),
        title: schedules[i].firstname));
    }
  } );

  _groupEvents(events);
}


int getHashCode(DateTime key){
  return key.day * 100000 +key.month * 100000 +key.year;
}

  _groupEvents(List<AppEvent> events){
    _groupedEvents = LinkedHashMap(equals: isSameDay ,hashCode: getHashCode);
    for (var event in events){
      DateTime date = DateTime.utc(event.date!.year, event.date!.month, event.date!.day, 12);
      if(_groupedEvents![date] == null) _groupedEvents![date]= [];
      _groupedEvents![date]!.add(event);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Padding(
    padding : const EdgeInsets.all(10.0),
    child: Column(
      children: [
        TableCalendar(
          eventLoader: _getEventsForDay,
          selectedDayPredicate: (day) => isSameDay(day, today),
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2025, 1, 1), 
          lastDay: DateTime.utc(2025, 12, 31),
          onDaySelected: _onDaySelected,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
          ),
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false
          ),
          ),


         MyDecoration(),




         Text(today.toString().split(" ")[0],
         style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 50.0,),
          textAlign: TextAlign.center,

         ),

          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 1,
              children: [
                ..._getEventsForDay(today).map((event) => Card(
                    color: Colors.blueGrey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    ),
                    child: ListTile(
                      title: Text(
                        event.title.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )))
              ],
            ),
          ),
  
      ],
    )

    
    );
  }
}