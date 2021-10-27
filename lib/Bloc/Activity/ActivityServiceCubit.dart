import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:regenki/Model/Activity.dart';
import 'package:regenki/Service/ActivityService.dart';
import 'package:regenki/Service/NotificationService.dart';

part 'ActivityServiceState.dart';

class ActivityServiceCubit extends Cubit<ActivityServiceState>{
  ActivityServiceCubit() : super(ActivityServiceInitial());

  void fetchGetData()async{
    try{

      List<Activity> activityList = await ActivityDatabaseHelper.instance.getActivity();
      emit(ActivityServiceGetListSuccess(activityList));
    }catch(error){
      emit(ActivityServiceFailed("Fetch Data Error"));
    }
  }

  void insertData(Activity activity)async{
    try{
      emit(ActivityServiceLoading());
      //await NotificationService().createNotification(activity);
      await ActivityDatabaseHelper.instance.add(activity);

      emit(ActivityServiceInsertSuccess(activity));
      List<Activity> activityList = await ActivityDatabaseHelper.instance.getActivity();
      emit(ActivityServiceGetListSuccess(activityList));
    }catch(error){
      emit(ActivityServiceFailed(error.toString()));
    }
  }

  void deleteData(int id)async{
    try{
      emit(ActivityServiceLoading());
      await ActivityDatabaseHelper.instance.remove(id);

      emit(ActivityServiceDeleteSuccess(id));

      List<Activity> activityList = await ActivityDatabaseHelper.instance.getActivity();
      emit(ActivityServiceGetListSuccess(activityList));

    }catch(error){
      emit(ActivityServiceFailed("Delete Failed"));
    }
  }

}