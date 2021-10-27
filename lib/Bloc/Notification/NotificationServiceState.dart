part of'NotificationServiceCubit.dart';

abstract class NotificationServiceState extends Equatable{
  const NotificationServiceState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotificationServiceInitial extends NotificationServiceState{}
class NotificationServiceLoading extends NotificationServiceState{}
class NotificationServiceAddSuccess extends NotificationServiceState{
  final Activity activity;
  NotificationServiceAddSuccess(this.activity);
  @override
  // TODO: implement props
  List<Object?> get props => [activity];
}
class NotificationServiceCancelSuccess extends NotificationServiceState{
  final int id;
  NotificationServiceCancelSuccess(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class NotificationServiceFailed extends NotificationServiceState{
  final String error;
  NotificationServiceFailed(this.error);
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}