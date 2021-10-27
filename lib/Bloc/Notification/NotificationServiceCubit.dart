import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regenki/Model/Activity.dart';
import 'package:regenki/Service/NotificationService.dart';

part 'NotificationServiceState.dart';

class NotificationServiceCubit extends Cubit<NotificationServiceState>{
  NotificationServiceCubit():super(NotificationServiceInitial());

  void add(Activity activity)async{
    try{
      emit(NotificationServiceLoading());
      //await NotificationService().createNotification(activity);
      emit(NotificationServiceAddSuccess(activity));
    }catch(error){
      emit(NotificationServiceFailed("Error create Notification"));
    }
  }
  void delete(int id)async{
    try{
      emit(NotificationServiceLoading());
      await NotificationService().cancelNotification(id);
      emit(NotificationServiceCancelSuccess(id));
    }catch(error){
      emit(NotificationServiceFailed("Error cancel Notification"));
    }
  }

}