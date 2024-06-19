part of 'book_bloc.dart';

@immutable
sealed class BookEvent {}
class FetchbookEvent extends BookEvent{}
