// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  // int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          'Статус заявки',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          physics: ScrollPhysics(),
          currentStep: 2,
          onStepCancel: () {
            // if (_index > 0) {
            //   setState(() {
            //     _index -= 1;
            //   });
            // }
          },
          onStepContinue: () {
            // if (_index <= 0) {
            //   setState(() {
            //     _index += 1;
            //   });
            // }
          },
          onStepTapped: (int index) {
            // setState(() {
            //   _index = index;
            // });
          },
          steps: <Step>[
            Step(
              title: const Text(
                'Заказ создан',
                style: TextStyle(
                  color: Color(0xff727CF5),
                  fontSize: 20.0,
                ),
              ),
              isActive: true,
              content: Text(
                '12 августа в 11:40:00',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                ),
              ),
              state: StepState.complete,
            ),
            Step(
              title: const Text(
                'Отгрузка от продавца в логистическую компанию',
                style: TextStyle(
                  color: Color(0xff727CF5),
                  fontSize: 20.0,
                ),
              ),
              isActive: true,
              content: Text(
                '12 августа в 11:40:00',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                ),
              ),
              state: StepState.complete,
            ),
            Step(
              title: const Text(
                'В пути',
                style: TextStyle(
                  color: Color(0xff727CF5),
                  fontSize: 20.0,
                ),
              ),
              isActive: false,
              content: Text(
                '12 августа в 11:40:00',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                ),
              ),
              state: StepState.indexed,
            ),
            Step(
              title: const Text(
                'Товар прибыл на жд станции',
                style: TextStyle(
                  color: Color(0xff727CF5),
                  fontSize: 20.0,
                ),
              ),
              isActive: false,
              content: Text(
                '12 августа в 11:40:00',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                ),
              ),
              state: StepState.indexed,
            ),
            Step(
              title: const Text(
                'Товар выдан',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                ),
              ),
              isActive: false,
              content: Text(
                '12 августа в 11:40:00',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                ),
              ),
              state: StepState.indexed,
            ),
          ],
        ),
      ),
    );
  }
}
