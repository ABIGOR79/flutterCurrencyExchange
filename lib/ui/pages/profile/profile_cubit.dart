import 'package:flutter_app/models/note_request.dart';
import 'package:flutter_app/repository/firebase/network_repository.dart';
import 'package:flutter_app/ui/pages/profile/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState(notelist: <NoteRequest>[]));

  Future<void> getList() async {
    final response = await NotesRepository().fetchNotes();
    emit(state.copyWith(notelist: response));
  }

  void setSortOrder(NoteSortOrder sortOrder) {
    emit(state.copyWith(sortOrder: sortOrder));
  }

  List<NoteRequest> get sortedNotes {
    final sortedList = List<NoteRequest>.from(state.notelist);
    switch (state.sortOrder) {
      case NoteSortOrder.byName:
        sortedList.sort((a, b) => a.name.compareTo(b.name));
        break;
      case NoteSortOrder.byContent:
        sortedList.sort((a, b) => a.content.compareTo(b.content));
        break;
      case NoteSortOrder.byCreatedDate:
        sortedList.sort((a, b) => a.createdDate.compareTo(b.createdDate));
        break;
    }
    return sortedList;
  }
}
