import 'package:flutter/material.dart';
import 'package:kovio_coffee/application/group/group_bloc.dart';
import 'package:kovio_coffee/domain/model/group_model.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupCard extends StatelessWidget {
  final GroupModel groupModel;

  const GroupCard({
    Key key,
    this.groupModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GroupBloc _groupBloc = context.read<GroupBloc>();

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          return _groupBloc.add(GroupEvent.setSelectedGroup(groupModel));
        },
        child: Container(
          height: sItemCard,
          padding: EdgeInsets.all(
            sPaddingContainer,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: sLineNormal,
                color: kPrimaryColor,
              ),
            ),
          ),
          child: Row(
            children: [
              // Group Name
              Expanded(
                flex: 3,
                child: Text(
                  groupModel.groupName,
                  textAlign: TextAlign.left,
                  style: yTextNormal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
