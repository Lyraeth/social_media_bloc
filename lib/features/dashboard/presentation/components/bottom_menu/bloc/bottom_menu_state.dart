part of 'bottom_menu_bloc.dart';

@immutable
class BottomMenuState extends Equatable {
  final int currentIndex;
  const BottomMenuState({required this.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}
