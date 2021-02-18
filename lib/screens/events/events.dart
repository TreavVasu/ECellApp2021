import 'package:ecellapp/core/utils/logger.dart';
import 'package:ecellapp/models/event.dart';
import 'package:ecellapp/screens/events/cubit/events_cubit.dart';
import 'package:ecellapp/widgets/stateful_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () => _getAllEvents(),
      child: Scaffold(
        body: BlocConsumer<EventsCubit, EventsState>(
          listener: (context, state) {
            if (state is EventsError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is EventsInitial) {
              return _buildInitial();
            } else if (state is EventsSuccess) {
              return _buildSuccess(context, state.json);
            } else if (state is EventsLoading) {
              return _buildLoading();
            } else {
              Log.e(tag: "EventsState", message: "State now is EventsError reached");
              return Container(); // TODO the user should be shown the error on screen instead of a snackbar, and a retry button.
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccess(BuildContext context, List<Event> json) {
    //TODO On success UI
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[Icon(Icons.check_circle_outline), Text(json[0].name)],
      ),
    );
  }

  Widget _buildInitial() {
    return Container();
  }

  void _getAllEvents() {
    final cubit = context.read<EventsCubit>();
    cubit.getAllEvents();
  }
}
