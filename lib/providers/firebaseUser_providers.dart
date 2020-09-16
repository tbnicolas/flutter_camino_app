import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_camino_app/models/producto_model.dart';

class FirebaseUserProvider{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;


  //SignInWithCredentials
  Future<AuthResult> signInWithCredentials(
      String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

//signUp
  Future<AuthResult> signUp(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

//Está logueado
  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Stream<String> get authState {
    return _firebaseAuth.onAuthStateChanged.map((user) => user?.uid);
  }

//Obtener informacion del usuario
  Future<FirebaseUser> getUser() async {
    final user = await _firebaseAuth.currentUser();
    return user;
  }
//Obetener todos los productos de una categoria
  Future<List<Producto>> getProducto(String idCategorias) async{
    List<Producto> listProduct = new List<Producto>();
    final jsonProduct = await _db.collection('productos').where("id" ,isEqualTo: idCategorias).getDocuments();
    jsonProduct.documents.forEach((jsonProducto) {
      listProduct.add(Producto.fromJson(jsonProducto.data));
    });
    return listProduct;
  }

//obtener categorias 
  Future<List> getCategoria()async{
    List listCategory ;
    final jsonCategory = await _db.collection('categorias').getDocuments();
    //print('JSON: ${jsonCategory.exists}');
   // List listCategory = jsonCategory['idCategorias'];
    //print('LIST: $listCategory');
    jsonCategory.documents.forEach((listIds) {
      
      listIds.data.forEach((key, value) { 
        final lista = value;
        listCategory = lista;
      });
    });
    print('TAM : ${jsonCategory.documents.length}');
    print('LIST : $listCategory');

    return listCategory;
  }
//Salir de la session
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}