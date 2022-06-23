import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stable/helpers.dart';
import 'package:stable/screens/screens.dart';
import 'package:stable/theme.dart';
import 'package:stable/widgets/widgets.dart';
import 'package:stable/models/task.dart';

import 'package:stable/models/horse.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Task> _generateTasks() {
    final Faker faker = Faker();
    final date = Helpers.randomDate();
    return List<Task>.generate(10, (i) => Task(icon: Icons.cleaning_services, isDone: false, name: faker.lorem.word(), time: Jiffy(date).Hm));
  }

  List<Horse> _generateHorse() {
    final Faker faker = Faker();
    return List<Horse>.generate(10, (i) => Horse(name: faker.person.firstName(), imgUrl: Helpers.randomPictureUrl(), tasks: _generateTasks()));
  }

  int selectedHorseIndex = 0;

  void handleHorseButton(int index) {

    setState(() {
      selectedHorseIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Horse> horses = _generateHorse();

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: _Horses(horses: horses, onPressed: handleHorseButton)
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            return _TaskTitle(task: horses[selectedHorseIndex].tasks[index]);
          }),
        )
      ],
    );
  }

}

class _TaskTitle extends StatefulWidget {
  const _TaskTitle({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  State<_TaskTitle> createState() => _TaskTitleState();
}

class _TaskTitleState extends State<_TaskTitle> {

  void handleSwitchButton(bool value) {

    // TODO: Change value in db before setting state.
    setState(() {
      widget.task.isDone = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => handleTaskPress(context),
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.2,
            )
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(widget.task.icon,
              color: AppColors.secondary,
              size: 40.0),
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.task.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      letterSpacing: 0.2,
                      wordSpacing: 1.5,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Switch.adaptive(
                  value: widget.task.isDone,
                  onChanged: handleSwitchButton
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.task.time.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 13,
                      letterSpacing: -0.2,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textFaded,
                    ),
                  )
                ],),
            ),
          ],),
        ),
      ),
    );
  }
  
  void handleTaskPress(BuildContext context) {
    Navigator.of(context).push(TaskScreen.route(widget.task));
  }
}


class _Horses extends StatelessWidget {
  _Horses({Key? key, required this.horses, required this.onPressed}) : super(key: key);

  final Function onPressed;
  List<Horse> horses;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 134,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 16),
              child: Text(
                  'Hästar',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                  color: AppColors.textFaded
                ),
              ),
            ),
            Expanded(
              child: buildHorseList(horses, onPressed),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHorseList(horses, callback) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            width: 60,
            child: GestureDetector(
              onTap: () => callback(index),
              child: _HorseCard(horseData: Horse(
                  name: horses[index].name,
                  imgUrl: horses[index].imgUrl,
                  tasks: horses[index].tasks
              ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HorseCard extends StatelessWidget {
  const _HorseCard({
    Key? key,
    required this.horseData,
  }) : super(key: key);

  final Horse horseData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: horseData.imgUrl),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              horseData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
