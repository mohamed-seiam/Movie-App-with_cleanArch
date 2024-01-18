import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/drawer/navigation_drawer_list_item.dart';

class NavigationExpandedListItem extends StatelessWidget {
  const NavigationExpandedListItem(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.children});

  final String title;
  final Function onPressed;
  final List<String> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        children: [
          for (int i = 0; i < children.length; i++)
            NavigationSubListItem(
                title: children[i],
                onPressed: () {
                  onPressed(i);
                }),
        ],
      ),
    );
  }
}
