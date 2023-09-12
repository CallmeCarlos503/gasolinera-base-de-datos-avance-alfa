import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  
      static String tabla1="CREATE TABLE USUARIOS (ID INTEGER AUTO INCREMENT PRIMARY KEY,NOMBRE TEXT NOT NULL,CORREO TEXT NOT NULL,PASSWORD TEXT NOT NULL,TELEFONO TEXT NOT NULL, ID_ESTADOS INTEGER NOT NULL, ID_ROL INTEGER NOT NULL);";
      static String tabla2="CREATE TABLE ESTADOS (ID INTEGER AUTO INCREMENT PRIMARY KEY,NOMBRE TEXT NOT NULL);";
      static String tabla3="CREATE TABLE ROL (ID INTEGER AUTO INCREMENT PRIMARY KEY,NOMBRE TEXT NOT NULL);";
      static String tabla4="CREATE TABLE AREAS(ID INTEGER AUTO INCREMENT PRIMARY KEY,NOMBRE TEXT NOT NULL,ID_ESTADOS INTEGER);";
      static String tabla5= "CREATE TABLE TIPO_GAS(ID INTEGER AUTO INCREMENT PRIMARY KEY,NOMBRE TEXT NOT NULL,ID_ESTADOS INTEGER);";
      static String tabla6= "CREATE TABLE PROMOS(ID INTEGER AUTO INCREMENT PRIMARY KEY,NOMBRE TEXT NOT NULL,IMAGEN TEXT NOT NULL,ID_ESTADOS INTEGER);";
      static String tabla7= "CREATE TABLE GASOLINA(ID INTEGER AUTO INCREMENT PRIMARY KEY,NOMBRE TEXT NOT NULL,PRECIO DECIMAL(2,4) NOT NULL,ID_AREA INTEGER,ID_TIPO_GAS INTEGER);";
      static String tabla8= "CREATE TABLE DEPARTAMENTO(ID INTEGER AUTO INCREMENT PRIMARY KEY,NOMBRE TEXT NOT NULL,ID_AREA INTEGER,COORDENADAS TEXT);";
      static String insert1="INSERT INTO ROL(ID, NOMBRE) VALUES (1, 'Administrador');";
      static String insert2="INSERT INTO ROL(ID, NOMBRE) VALUES (2, 'Usuario');";
      static String insert3="INSERT INTO ESTADOS(ID, NOMBRE) VALUES (1, 'Activo');";
      static String insert4="INSERT INTO ESTADOS(ID, NOMBRE) VALUES (2, 'Inactivo');";
     
  static Future<Database> _openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'puma.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(tabla1);
        await db.execute(tabla2);
        await db.execute(tabla3);
        await db.execute(tabla4);
        await db.execute(tabla5);
        await db.execute(tabla6);
        await db.execute(tabla7);
        await db.execute(tabla8);
        await db.execute(insert1);
        await db.execute(insert2);
        await db.execute(insert3);
        await db.execute(insert4);
      },
    );
  }

  //INSERTAR
  static Future<void> insertar(
      String nombre, String correo, String password, String telefono) async {
    Database db = await _openDB();
    await db.insert('USUARIOS', {
      'NOMBRE': nombre,
      'CORREO': correo,
      'PASSWORD': password,
      'TELEFONO': telefono,
      'ID_ESTADOS': 1,
      'ID_ROL': 1
    });
    db.close();
  }

  //ELIMINAR
  static Future<void> eliminar(int id) async {
    Database db = await _openDB();
    await db.delete('USUARIOS', where: 'ID =?', whereArgs: [id]);
    db.close();
  }

  //MODIFICAR
  static Future<void> modificar(int id, String nombre, String correo,
      String password, String telefono) async {
    Database db = await _openDB();
    await db.update(
      'USUARIOS',
      {
        'NOMBRE': nombre,
        'CORREO': correo,
        'PASSWORD': password,
        'TELEFONO': telefono,
      },
      where: 'ID =?',
      whereArgs: [id],
    );
    db.close();
  }

  //CONSULTAR
  static Future<List<Map<String, dynamic>>> consultar() async {
    Database db = await _openDB();
    List<Map<String, dynamic>> data = await db.query('USUARIOS');
    db.close();
    return data;
  }

  //LOGIN
  static Future<bool> login(String correo, String password) async {
    Database db = await _openDB();
    List<Map<String, dynamic>> data = await db.query('USUARIOS');
    db.close();
    for (int i = 0; i < data.length; i++) {
      if (data[i]['CORREO'] == correo && data[i]['PASSWORD'] == password) {
        return true;
      }
    }
    return false;
  }
}
