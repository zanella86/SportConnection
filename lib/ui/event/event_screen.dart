import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_connection/domain/enums/event_type.dart';
import 'package:sport_connection/domain/enums/frequency.dart';
import 'package:sport_connection/domain/models/event_dto_model.dart';
import 'package:sport_connection/presentation/blocs/events/events_save_cubit.dart';
import 'package:sport_connection/presentation/widgets/bottom_bar.dart';
import 'package:sport_connection/presentation/widgets/rounded_button.dart';
import 'package:sport_connection/presentation/widgets/rounded_textfield.dart';
import 'package:sport_connection/ui/home/home_screen.dart';
import 'package:sport_connection/ui/profile/profile_screen.dart';

class EventScreen extends StatelessWidget {
  static const String id = '/event_screen';

  EventScreen({super.key});

  var _inputtedAddress = '';
  var _inputtedDescription = '';
  var _inputtedName = '';
  var _inputtedTime = '';

  final _controllerAddres = TextEditingController(text: '');
  final _controllerDescription = TextEditingController(text: '');
  final _controllerName = TextEditingController(text: '');
  final _controllerTime = TextEditingController(text: '');

  var _paid = false;
  var _selectedEventType = 'FUN';
  var _selectedFrequency = 'ONE_TIME';

  @override
  Widget build(BuildContext context) {
    final eventCubit = context.watch<EventSaveCubit>();


    return Scaffold(
        body: InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: eventCubit.state.isSaved
                        ? [
                            const Text(
                              'Evento registado com sucesso!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const Text(
                              'Para visualizar os eventos cadastros vá até a home :D',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            RoundedButton(
                              text: 'Cadastrar outro evento',
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, EventScreen.id);
                              },
                            ),
                          ]
                        : [
                            const Text(
                              'Adicione um evento:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RoundedTextField(
                              label: 'Nome do evento',
                              textInputType: TextInputType.text,
                              onTextChange: (text) => _inputtedName = text,
                              controller: _controllerName,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            RoundedTextField(
                              label: 'Descrição',
                              textInputType: TextInputType.multiline,
                              onTextChange: (text) =>
                                  _inputtedDescription = text,
                              controller: _controllerDescription,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            RoundedTextField(
                              label: 'Endereço',
                              textInputType: TextInputType.streetAddress,
                              onTextChange: (text) => _inputtedAddress = text,
                              controller: _controllerAddres,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            RoundedTextField(
                              label: 'Hora',
                              textInputType: TextInputType.text,
                              onTextChange: (text) => _inputtedTime = text,
                              controller: _controllerTime,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const Text("Frequencia: "),
                                DropdownButton(
                                  items: Frequency.values
                                      .map<DropdownMenuItem<String>>(
                                        (value) => DropdownMenuItem<String>(
                                          value: value.name,
                                          child: Text(value.name),
                                        ),
                                      )
                                      .toList(),
                                  value: eventCubit.state.formFrequency,
                                  onChanged: (String? value) {
                                    eventCubit
                                        .changeFrequency(value ?? 'ONE_TIME');
                                    //_selectedFrequency = value ?? '';
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const Text("Tipo evento: "),
                                DropdownButton(
                                  items: EventType.values
                                      .map<DropdownMenuItem<String>>(
                                        (value) => DropdownMenuItem<String>(
                                          value: value.name,
                                          child: Text(value.name),
                                        ),
                                      )
                                      .toList(),
                                  value: eventCubit.state.formEventType,
                                  onChanged: (String? value) {
                                    eventCubit.changeEventType(value ?? 'FUN');
                                    //_selectedEventType = value ?? '';
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const Text("PAGO ?"),
                                Switch(
                                  value: eventCubit.state.formIsPaid,
                                  onChanged: (bool newValue) {
                                    eventCubit.toggleSwitch();
                                  },
                                ),
                              ],
                            ),
                            RoundedButton(
                              text: 'Cadastrar evento',
                              onPressed: () => {
                                if (_validateFields(context))
                                  {
                                    context
                                        .read<EventSaveCubit>()
                                        .save(EventDTOModel(
                                          name: _inputtedName,
                                          description: _inputtedDescription,
                                          time: _inputtedTime,
                                          address: _inputtedAddress,
                                          eventType:
                                              eventCubit.state.formEventType,
                                          frequency:
                                              eventCubit.state.formFrequency,
                                          paid: eventCubit.state.formIsPaid,
                                        ))
                                  }
                              },
                            )
                          ],
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.calendar_today),
        ),
        bottomNavigationBar: BottomBar(
          items: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.gpp_good)),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                },
                icon: const Icon(Icons.home)),
            const SizedBox(
              width: 24,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, ProfileScreen.id);
                },
                icon: const Icon(Icons.person))
          ],
        )
        /*  bottomNavigationBar: eventCubit.state.errorMessage.isNotEmpty
          ? BottomAppBar(
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Center(
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(eventCubit.state.errorMessage),
                  ),
                );
              },
              child: Text(
                eventCubit.state.errorMessage,
                style: TextStyle(
                  color: Theme.of(context).errorColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          : null,*/
        );
  }

  bool _validateFields(context) {
    if (_inputtedName.isEmpty) {
      _showSnack(context, 'Nome do evento é obrigatório');
      return false;
    }
    if (_inputtedDescription.isEmpty) {
      _showSnack(context, 'Descrição é obrigatória');
      return false;
    }
    if (_inputtedAddress.isEmpty) {
      _showSnack(context, 'Endereço é obrigatório');
      return false;
    }
    if (_inputtedTime.isEmpty) {
      _showSnack(context, 'Hora é obrigatório');
      return false;
    }

    return true;
  }

  void _showSnack(context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
