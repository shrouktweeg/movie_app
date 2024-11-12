import 'package:equatable/equatable.dart';

class BrowseEntity extends Equatable{
 final int id;
  final String name;
  const BrowseEntity( {
    required this.id,
    required this.name,
  });



  @override
  // TODO: implement props
  List<Object?> get props => [id,name];

}