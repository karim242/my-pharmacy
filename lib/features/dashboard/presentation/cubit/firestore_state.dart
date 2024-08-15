abstract class FirestoreState {}

class FirestoreInitial extends FirestoreState {}

class FirestoreLoading extends FirestoreState {}

class FirestoreSuccess extends FirestoreState {
  final String message;

  FirestoreSuccess(this.message);
}

class FirestoreError extends FirestoreState {
  final String message;

  FirestoreError(this.message);
}
