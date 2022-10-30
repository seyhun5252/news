
import '../modules/enums/loading_types.dart';

class LoadingState {
  LoadingType loadingType;
  String error;
  String completed;

  LoadingState({ this.loadingType, this.error, this.completed});
}
