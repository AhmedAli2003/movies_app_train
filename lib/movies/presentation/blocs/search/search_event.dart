part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  final String name;
  final int page;
  const SearchEvent(this.name, this.page);

  @override
  List<Object> get props => [name];
}
