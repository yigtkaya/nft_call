import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:nft_call/view/event_detail/event_detail.dart';

class NotificationController extends GetxController{
   final messaging = FirebaseMessaging.instance;
   final userToken = "".obs;
   @override
   void onInit() {
      getToken();
      onForegroundNotification();
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
      super.onInit();
   }

   String getToken() {
      messaging.getToken().then((value) {
         userToken.value = value!;
         print(value);
      });
      return messaging.getToken().toString();
   }

   void onForegroundNotification() {
      FirebaseMessaging.onMessage.listen((RemoteMessage event) {
         print("message recieved");
         print(event.notification!.body);
      });
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
         print('Message clicked!');
      });
   }

   void requestPermissions() async {
      NotificationSettings settings = await messaging.requestPermission(
         alert: true,
         announcement: false,
         badge: true,
         carPlay: false,
         criticalAlert: false,
         provisional: false,
         sound: true,
      );
   }

   void _handleMessage(RemoteMessage message) {
      if (message.data['type'] == 'chat') {
         Get.to(EventDetailView(favCount: 0, isFavorite: false));

      }
   }
}