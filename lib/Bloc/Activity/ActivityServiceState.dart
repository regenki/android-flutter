part of'ActivityServiceCubit.dart';

abstract class ActivityServiceState extends Equatable{
  const ActivityServiceState();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ActivityServiceInitial extends ActivityServiceState{}
class ActivityServiceLoading extends ActivityServiceState{}
class ActivityServiceInsertSuccess extends ActivityServiceState{
  final Activity activity;
  ActivityServiceInsertSuccess(this.activity);
  @override
  // TODO: implement props
  List<Object?> get props => [activity];
}
class ActivityServiceUpdateSuccess extends ActivityServiceState{
  final Activity activity;
  final int id;
  ActivityServiceUpdateSuccess(this.activity,this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [activity,id];
}
class ActivityServiceDeleteSuccess extends ActivityServiceState{
  final int id;
  ActivityServiceDeleteSuccess(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class ActivityServiceGetListSuccess extends ActivityServiceState{
  final List<Activity> activityList ;
  ActivityServiceGetListSuccess(this.activityList);
  @override
  // TODO: implement props
  List<Object?> get props => [activityList];
}
class ActivityServiceFailed extends ActivityServiceState{
  final String error;
  ActivityServiceFailed(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}