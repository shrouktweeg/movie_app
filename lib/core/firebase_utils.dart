import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/core/config/constants.dart';
import 'package:movie_app/features/home/data/models/popular_model.dart';

class FireBaseUtils{
  static CollectionReference<PopularMoviesModel>getCollectionReference(){
   return FirebaseFirestore.instance.collection(Constants.collectionName)
        .withConverter<PopularMoviesModel>
      (fromFirestore: (snapShot,_)=>PopularMoviesModel.fromJson(snapShot.data()!),
        toFirestore: (popularMoviesModel,_)=>popularMoviesModel.toJson());
  }
  static Future<void> addMovie(PopularMoviesModel popularMoviesModel) async{
    var collectionReference=getCollectionReference();
    String id=popularMoviesModel.id.toString();
   var docRef= collectionReference.doc(id);
  return docRef.set(popularMoviesModel);
  }
  static Future<void>  deleteMovie(PopularMoviesModel movie)async{
    CollectionReference<PopularMoviesModel> collectionRef=getCollectionReference();
    DocumentReference<PopularMoviesModel> docRef= collectionRef.doc(movie.id.toString());
    return docRef.delete();
  }
  static Stream<QuerySnapshot<PopularMoviesModel>> getMoviesList() {
    var collectionRef=getCollectionReference();
    return collectionRef
        .snapshots();
  }
}

