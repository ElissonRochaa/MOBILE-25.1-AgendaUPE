import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreeen extends StatefulWidget {
  const CalendarScreeen({super.key});

  @override
  State<CalendarScreeen> createState() => _CalendarScreeenState();
}

class _CalendarScreeenState extends State<CalendarScreeen> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding : const EdgeInsets.all(20.0),
    child: Column(
      children: [
        TableCalendar(
          selectedDayPredicate: (day) => isSameDay(day, today),
          focusedDay: today, 
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

         Text(today.toString().split(" ")[0]),
  
      ],
    )

    
    );
  }
}