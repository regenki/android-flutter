import 'package:flutter/material.dart';
import 'package:regenki/Model/Activity.dart';
import 'package:regenki/Shared/Theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regenki/Bloc/Activity/ActivityServiceCubit.dart';
import 'package:regenki/View/Components/ActivityTile.dart';
import 'package:regenki/View/Page/AddInputActivityViewPage.dart';
import 'package:regenki/View/Page/DetailActivityViewPage.dart';

class ActivityViewPage extends StatefulWidget {
  const ActivityViewPage({Key? key}) : super(key: key);

  @override
  State<ActivityViewPage> createState() => _ActivityViewPageState();
}

class _ActivityViewPageState extends State<ActivityViewPage> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<ActivityServiceCubit>().fetchGetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    activityList(List<Activity> activityList) {
      return activityList.isEmpty
          ? Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/ilustrations/noActivity.png",
                      width: 120,
                      height: 120,
                    ),
                    Text(
                      "No Activity",
                      style: poppinsPrimary.copyWith(
                          fontWeight: semibold, fontSize: 24),
                    )
                  ],
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.only(top: 24),
              color: Colors.white,
              child: RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    context.read<ActivityServiceCubit>().fetchGetData();
                  });
                },
                child: ListView.builder(
                    itemCount: activityList.length,
                    itemBuilder: (context, index) {
                      var item = activityList[index];
                      return Dismissible(
                        key: UniqueKey(),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailActivityViewPage(
                                            activity: activityList[index])));
                          },
                          child: ActivityTile(
                            title: item.title,
                            category: item.category,
                            date: item.dateTime,
                            image: item.sticker,
                          ),
                        ),
                        background: Container(
                          color: Colors.red,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delete",
                                  style: poppinsWhiteColor,
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            context
                                .read<ActivityServiceCubit>()
                                .deleteData(activityList[index].id!);
                          });
                        },
                      );
                    }),
              ));
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Activity",
          style: poppinstextColor.copyWith(
              fontSize: 24, color: Color(0xff000000), fontWeight: semibold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 12),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    style: poppinsPrimary.copyWith(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.only(
                            left: 16, right: 8, top: 8, bottom: 8),
                        hintText: "Search...",
                        hintStyle: poppinsPrimary,
                        border: OutlineInputBorder(),
                        isDense: true),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddInputViewPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 64),
                        child: Text(
                          "Add Activity",
                          style: poppinstextColor.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocConsumer<ActivityServiceCubit, ActivityServiceState>(
                listener: (context, state) {},
                builder: (context, state) {
                  print(state);
                  if (state is ActivityServiceLoading) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is ActivityServiceGetListSuccess) {
                    return Expanded(child: activityList(state.activityList));
                  } else {
                    return Expanded(
                        child: Center(child: CircularProgressIndicator()));
                  }
                })
          ],
        ),
      ),
    );

    return BlocConsumer<ActivityServiceCubit, ActivityServiceState>(
        builder: (context, state) {
          print(state);
          if (state is ActivityServiceGetListSuccess) {
            if (state.activityList == 0) {
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: Text(
                    "Activity",
                    style: poppinstextColor.copyWith(
                        fontSize: 24,
                        color: Color(0xff000000),
                        fontWeight: semibold),
                  ),
                  automaticallyImplyLeading: false,
                ),
                body: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 12),
                          child: SizedBox(
                            height: 50,
                            child: TextField(
                              style: poppinsPrimary.copyWith(
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.only(
                                      left: 16, right: 8, top: 8, bottom: 8),
                                  hintText: "Search...",
                                  hintStyle: poppinsPrimary,
                                  border: OutlineInputBorder(),
                                  isDense: true),
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddInputViewPage()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(8)),
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 32),
                                  child: Icon(
                                    Icons.add_rounded,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 64),
                                  child: Text(
                                    "Add Activity",
                                    style: poppinstextColor.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: RefreshIndicator(
                        onRefresh: () async {
                          setState(() {
                            context.read<ActivityServiceCubit>().fetchGetData();
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/ilustrations/noActivity.png",
                                width: 240,
                                height: 240,
                              ),
                              Text(
                                "No Activity",
                                style: poppinsPrimary.copyWith(
                                    fontWeight: semibold, fontSize: 24),
                              )
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              );
            }
          }
        },
        listener: (context, state) {});
  }
}
/*
return Scaffold(
body: Container(
padding: EdgeInsets.symmetric(horizontal: 24),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Container(
margin: EdgeInsets.only(top: 48),
child: Text(
"Activity",
style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
),
),
Container(
margin: EdgeInsets.only(top: 48),
child: SizedBox(
height: 50,
child: TextField(
style: poppinsPrimary.copyWith(
fontSize: 14,
),
decoration: InputDecoration(
isCollapsed: true,
contentPadding: EdgeInsets.only(
left: 16, right: 8, top: 8, bottom: 8),
hintText: "Search...",
hintStyle: poppinsPrimary,
border: OutlineInputBorder(),
isDense: true),
),
)),
Container(
margin: EdgeInsets.only(top: 12),
child: GestureDetector(
onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddInputViewPage()));},
child: Container(
decoration: BoxDecoration(
color: primaryColor,
borderRadius: BorderRadius.circular(8)),
height: MediaQuery.of(context).size.height * 0.06,
child: Row(
children: [
Padding(
padding: const EdgeInsets.only(left: 32),
child: Icon(
Icons.add_rounded,
color: Colors.white,
size: 32,
),
),
Padding(
padding: const EdgeInsets.only(left: 64),
child: Text(
"Add Activity",
style: poppinstextColor.copyWith(
fontSize: 16, fontWeight: FontWeight.w700),
),
),
],
),
),
),
),
BlocConsumer<ActivityServiceCubit,ActivityServiceState>(builder: (context,state){
if(state is ActivityServiceGetListSuccess){
print(state.activityList);
if(state.activityList == 0){
return Container(
margin: const EdgeInsets.only(top: 80),
child: Center(
child: Stack(
alignment: Alignment.center,
children: [
Padding(
padding: EdgeInsets.only(),
child: Container(
margin: EdgeInsets.symmetric(horizontal: 24),
height: 280,
child: Image.network(
"https://static.wikia.nocookie.net/bandori/images/e/e5/Pessimistic_Girl_Live2D_Model.png/revision/latest/scale-to-width-down/666?cb=20200315175650"),
),
),
Positioned(top: 240, child: Text("No Activity"))
],
),
),
);
}else{
return activityList(state.activityList);
}

}
return Center(child: CircularProgressIndicator(color: primaryColor,),);
}, listener: (context,state){
if(state is ActivityServiceFailed){

}
}),

],
),
),
);*/
