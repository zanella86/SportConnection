import 'package:flutter/material.dart';
import 'package:sport_connection/data/entities/event_entity.dart';
import 'package:sport_connection/domain/enums/event_type.dart';
import 'package:sport_connection/domain/enums/frequency.dart';

class EventViewScreen extends StatelessWidget {
  static const String id = '/event_view_screen';

  final EventEntity? entity;

  const EventViewScreen({Key? key, this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _textStyle = TextStyle(fontSize: 22);
    var _iconsTextStyle = TextStyle(fontSize: 20, color: Colors.grey);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            _onBackPressed(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/kakashi.jpg"),
            SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            '${entity?.name}',
                            style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${entity?.description}',
                            style: const TextStyle(
                              fontSize: 18,
                              // color: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            height: 10,
                            thickness: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.keyboard_double_arrow_up, size: 50, color: entity?.typeEvent == EventType.RANKED ? Theme.of(context).primaryColor : Colors.grey,),
                            Text('RANKED', style: _iconsTextStyle,),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.note_alt, size: 50, color: entity?.typeEvent == EventType.LEARN ? Theme.of(context).primaryColor : Colors.grey,),
                            Text('LEARN', style: _iconsTextStyle,),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.beach_access, size: 50, color: entity?.typeEvent == EventType.FUN ? Theme.of(context).primaryColor : Colors.grey,),
                            Text('FUN', style: _iconsTextStyle,),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Local: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        ),
                        Text(
                          '${entity?.address}',
                          style: _textStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Horário: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        ),
                        Text(
                          '${entity?.time}',
                          style: _textStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Freq: ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        ),
                        Text(
                          '${FrequencyUtils.toStringFormatted(entity?.frequency ?? Frequency.ONE_TIME)}',
                          style: _textStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Pago? ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 25),
                        ),
                        Text(
                          '${entity?.paid}',
                          style: _textStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onBackPressed(context) {
    Navigator.pop(context);
  }
}
