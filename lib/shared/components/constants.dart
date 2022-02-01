import 'dart:io';

import 'package:mega_store/layout/cubit/cubit.dart';
import 'package:mega_store/modules/login/shop_login_screen.dart';
import 'package:mega_store/shared/network/local/cache_helper.dart';

import 'componets.dart';


String ?token = '';
String ?uId = '';


void signOut(context) {
  CacheHelper.removeData(key: 'token');
  token=null;
  var model = ShopCubit.get(context).userModel;
  // ShopCubit.get(context).favoritesModel=[];

  model!.data!.name='';
  model.data!.email='';
  model.data!.phone='';
  navigateAndFinish(context, ShopLoginScreen(),);
  ShopCubit.get(context).currentIndex=0;


}


String getOS(){
  return Platform.operatingSystem;
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
