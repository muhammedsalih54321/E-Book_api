import 'package:bloc/bloc.dart';
import 'package:e_book/Repository/Api/Book/book_api.dart';
import 'package:e_book/Repository/Model/book_model.dart';
import 'package:meta/meta.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  late List<Bookmodel> bookmodel;
  BookApi bookApi=BookApi();
  BookBloc() : super(BookInitial()) {
    on<FetchbookEvent>((event, emit)async {
    emit(Bookblocloading());
    try {
      bookmodel=await bookApi.getBook();
      emit(Bookblocloaded());
    } catch (e) {
      print(e);
      emit(Bookblocerror());
    }
    });
  }
}
