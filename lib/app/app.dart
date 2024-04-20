import 'package:firebase_stacked/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:firebase_stacked/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:firebase_stacked/ui/views/home/home_view.dart';
import 'package:firebase_stacked/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_stacked/services/environment_service.dart';
import 'package:firebase_stacked/services/firebase_core_service.dart';
import 'package:firebase_stacked/services/firestore_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: EnvironmentService),
    InitializableSingleton(classType: FirebaseCoreService),
    LazySingleton(classType: FirestoreService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
