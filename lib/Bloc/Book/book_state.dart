part of 'book_bloc.dart';

@immutable
sealed class BookState {}

final class BookInitial extends BookState {}
class Bookblocloading extends BookState {}
class Bookblocloaded extends BookState {}
class Bookblocerror extends BookState {}
