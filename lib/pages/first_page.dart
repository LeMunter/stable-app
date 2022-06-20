import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stable/helpers.dart';
import 'package:stable/theme.dart';
import 'package:stable/widgets/widgets.dart';

import 'package:stable/models/story_data.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: _Horses()
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Text('hej');
            },
          ),
        )
      ],
    );
  }
}

class _TaskTitle extends StatelessWidget {
  const _TaskTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class _Horses extends StatelessWidget {
  const _Horses({Key? key}) : super(key: key);

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
              padding: EdgeInsets.only(left: 16.0, top: 0, bottom: 16),
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
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final faker = Faker();
                    return SizedBox(
                      width: 60,
                      child: _HorseCard(storyData: StoryData(
                          name: faker.person.name(),
                          url: Helpers.randomPictureUrl(),
                        ),
                      ),
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HorseCard extends StatelessWidget {
  const _HorseCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
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
