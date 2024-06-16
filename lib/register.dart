import 'package:flutter/material.dart';
import 'package:proyecto/resdialog.dart';
import 'package:proyecto/services.dart';
import 'dart:ui';
import 'package:flutter/services.dart';  // Import necesario para usar InputFormatter

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _identification = '';
  String _name = '';
  String _email = '';
  String _selectedRole = 'Usuario';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrarse"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/OIG2.C5T.jpg'),
           // NetworkImage('https://th.bing.com/th/id/OIG2.C5T.cbOT9XQXbf_Vth_e?pid=ImgGn'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: <Widget>[
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 90.0,
                      backgroundImage: AssetImage('assets/diseno-logotipo-vectorial-salon-belleza-o-peluqueria-o-diseno-cosmetico-ilustracion-vector-concepto-linea-cara-mujer-abstracta_501705-134.avif'),
                      //NetworkImage('https://img.freepik.com/vector-premium/diseno-logotipo-vectorial-salon-belleza-o-peluqueria-o-diseno-cosmetico-ilustracion-vector-concepto-linea-cara-mujer-abstracta_501705-134.jpg'),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Identificación',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingresa tu identificación';
                        }
                        if (value.length != 10) {
                          return 'La identificación debe tener 10 caracteres';
                        }
                        return null;
                      },
                      onSaved: (value) => _identification = value!,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLength: 30,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor ingresa tu nombre';
                        }
                        if (value.length < 2 || value.length > 30) {
                          return 'El nombre debe tener entre 2 y 30 caracteres';
                        }
                        return null;
                      },
                      onSaved: (value) => _name = value!,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLength: 30,
                      validator: (value) {
                        if (value!.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Ingresa un correo electrónico válido';
                        }
                        if (value.length < 2 || value.length > 30) {
                          return 'El correo electrónico debe tener entre 2 y 30 caracteres';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLength: 15,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingresa una contraseña válida';
                        }
                        if (value.length < 6 || value.length > 15) {
                          return 'La contraseña debe tener entre 6 y 15 caracteres';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value!,
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                      ),
                      child: const Text('Registrar'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print(
                              'Identificación: $_identification, Nombre: $_name, Correo electrónico: $_email, Rol: $_selectedRole');
                          var res = await agregarUsuario(
                              correo: _email,
                              identificacion: _identification,
                              nombre: _name,
                              rol: _selectedRole,
                              pass: _password);
                          if (res) {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                    isSuccess: true,
                                    descripcion:
                                        "Usuario agregado correctamente");
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                    isSuccess: false,
                                    descripcion:
                                        "Error al momento de agregar el usuario.");
                              },
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
