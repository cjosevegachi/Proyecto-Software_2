import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto/register.dart';

void main() {
  //Pruebas unitarias

  testWidgets('Test de validación de formulario', (WidgetTester tester) async {
    // Construye la pantalla RegisterScreen dentro de un WidgetTester
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    // Encuentra los TextFormField por su labelText
    Finder identificationField = find.widgetWithText(TextFormField, 'Identificación');
    Finder nameField = find.widgetWithText(TextFormField, 'Nombre');
    Finder emailField = find.widgetWithText(TextFormField, 'Correo electrónico');
    Finder passwordField = find.widgetWithText(TextFormField, 'Contraseña');
    Finder registerButton = find.widgetWithText(ElevatedButton, 'Registrar');

    // Ingresa texto válido en cada campo
    await tester.enterText(identificationField, '1234567890');
    await tester.enterText(nameField, 'John Doe');
    await tester.enterText(emailField, 'john.doe@example.com');
    await tester.enterText(passwordField, 'password');

    // Toca el botón de registro y espera que la validación pase
    await tester.tap(registerButton);
    await tester.pump();

    // Verifica que no haya errores de validación
    expect(find.text('Por favor ingresa tu identificación'), findsNothing);
    expect(find.text('Por favor ingresa tu nombre'), findsNothing);
    expect(find.text('Ingresa un correo electrónico válido'), findsNothing);
    expect(find.text('Ingresa una contraseña válida'), findsNothing);
  });
  
  testWidgets('debería retornar error si no tiene 10 caracteres', (WidgetTester tester) async {
      // Encuentra los TextFormField por su labelText
    Finder identificationField = find.widgetWithText(TextFormField, 'Identificación');
    Finder nameField = find.widgetWithText(TextFormField, 'Nombre');
    Finder emailField = find.widgetWithText(TextFormField, 'Correo electrónico');
    Finder passwordField = find.widgetWithText(TextFormField, 'Contraseña');
    Finder registerButton = find.widgetWithText(ElevatedButton, 'Registrar');

    // Ingresa texto válido en cada campo
    await tester.enterText(identificationField, 'null');
    await tester.enterText(nameField, 'John Doe');
    await tester.enterText(emailField, 'john.doe@example.com');
    await tester.enterText(passwordField, 'password');
    
    await tester.tap(registerButton);
    await tester.pump();

    // Verifica que no haya errores de validación
    expect(find.text('Por favor ingresa tu identificación'), findsNothing);
    expect(find.text('Por favor ingresa tu nombre'), findsNothing);
    expect(find.text('Ingresa un correo electrónico válido'), findsNothing);
    expect(find.text('Ingresa una contraseña válida'), findsNothing);
    });

  //Pruebas de integracion
  
  group('RegisterScreen', () {
    testWidgets('renders correctly and validates form', (WidgetTester tester) async {
      // Construir el widget RegisterScreen
      await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

      // Esperar a que se resuelva la carga inicial de la pantalla
      await tester.pumpAndSettle();

      // Encuentra los TextFormField por su labelText
      Finder identificationField = find.widgetWithText(TextFormField, 'Identificación');
      Finder nameField = find.widgetWithText(TextFormField, 'Nombre');
      Finder emailField = find.widgetWithText(TextFormField, 'Correo electrónico');
      Finder passwordField = find.widgetWithText(TextFormField, 'Contraseña');
      Finder registerButton = find.widgetWithText(ElevatedButton, 'Registrar');

      // Ingresa texto válido en cada campo
      await tester.enterText(identificationField, '1234567890');
      await tester.enterText(nameField, 'John Doe');
      await tester.enterText(emailField, 'john.doe@example.com');
      await tester.enterText(passwordField, 'password');

      // Toca el botón de registro y espera que la validación pase
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      // Verifica que no haya errores de validación
      expect(find.text('Por favor ingresa tu identificación'), findsNothing);
      expect(find.text('Por favor ingresa tu nombre'), findsNothing);
      expect(find.text('Ingresa un correo electrónico válido'), findsNothing);
      expect(find.text('Ingresa una contraseña válida'), findsNothing);

      // Puedes agregar más validaciones según el comportamiento esperado después de la validación
    });
  });

  testWidgets('Test de integración de RegisterScreen', (WidgetTester tester) async {
    // Construir la pantalla RegisterScreen

    // Esperar a que se resuelva la carga inicial de la pantalla
    await tester.pumpAndSettle();

    // Encuentra los TextFormField por su labelText
    Finder identificationField = find.widgetWithText(TextFormField, 'Identificación');
    Finder nameField = find.widgetWithText(TextFormField, 'Nombre');
    Finder emailField = find.widgetWithText(TextFormField, 'Correo electrónico');
    Finder passwordField = find.widgetWithText(TextFormField, 'Contraseña');
    Finder registerButton = find.widgetWithText(ElevatedButton, 'Registrar');

    // Ingresa texto válido en cada campo
    await tester.enterText(identificationField, '');
    await tester.enterText(nameField, 'John Doe');
    await tester.enterText(emailField, 'null');
    await tester.enterText(passwordField, 'password');

    // Toca el botón de registro y espera que la validación pase
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

    // Verifica que no haya errores de validación
    expect(find.text('Por favor ingresa tu identificación'), findsNothing);
    expect(find.text('Por favor ingresa tu nombre'), findsNothing);
    expect(find.text('Ingresa un correo electrónico válido'), findsNothing);
    expect(find.text('Ingresa una contraseña válida'), findsNothing);

    // Puedes agregar más validaciones según el comportamiento esperado después de la validación
  });







//Seguridad
testWidgets('Manejo de errores en RegisterScreen', (WidgetTester tester) async {
  // Construye la pantalla RegisterScreen
  await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

  // Espera a que se resuelva la carga inicial de la pantalla
  await tester.pumpAndSettle();

  // Encuentra los TextFormField y el botón de registro
  Finder identificationField = find.widgetWithText(TextFormField, 'Identificación');
  Finder nameField = find.widgetWithText(TextFormField, 'Nombre');
  Finder emailField = find.widgetWithText(TextFormField, 'Correo electrónico');
  Finder passwordField = find.widgetWithText(TextFormField, 'Contraseña');
  Finder registerButton = find.widgetWithText(ElevatedButton, 'Registrar');

  // Ingresa texto inválido o vacío en cada campo
  await tester.enterText(identificationField, '');
  await tester.enterText(nameField, 'saul');
  await tester.enterText(emailField, 'correo@gmail.com');
  await tester.enterText(passwordField, '1234567');

  // Toca el botón de registro y espera que aparezcan mensajes de error
  await tester.tap(registerButton);
  await tester.pumpAndSettle();

  // Verifica que los mensajes de error se muestren correctamente
  expect(find.text('Por favor ingresa tu identificación'), findsOneWidget);
  expect(find.text('Por favor ingresa tu nombre'), findsOneWidget);
  expect(find.text('Ingresa un correo electrónico válido'), findsOneWidget);
  expect(find.text('Ingresa una contraseña válida'), findsOneWidget);
});
testWidgets('Prueba de rendimiento de la aplicación', (WidgetTester tester) async {
  // Construye la pantalla RegisterScreen
  await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

  // Espera a que se resuelva la carga inicial de la pantalla
  await tester.pumpAndSettle();

  // Simulación de acciones y evaluación del rendimiento
  // -----------------------------------------------------

  Stopwatch stopwatch = Stopwatch();
  List<Map<String, dynamic>> acciones = [];

  // Simulación: Ingresar texto en campos de formulario
  stopwatch.start();
  await tester.enterText(find.widgetWithText(TextFormField, 'Identificación'), '1234567890');
  stopwatch.stop();
  acciones.add({
    'acción': 'Ingresar identificación',
    'valor': '1234567890',
    'tiempo': stopwatch.elapsedMilliseconds
  });

  stopwatch.reset();
  stopwatch.start();
  await tester.enterText(find.widgetWithText(TextFormField, 'Nombre'), 'John Doe');
  stopwatch.stop();
  acciones.add({
    'acción': 'Ingresar nombre',
    'valor': 'John Doe',
    'tiempo': stopwatch.elapsedMilliseconds
  });

  stopwatch.reset();
  stopwatch.start();
  await tester.enterText(find.widgetWithText(TextFormField, 'Correo electrónico'), 'john.doe@example.com');
  stopwatch.stop();
  acciones.add({
    'acción': 'Ingresar correo electrónico',
    'valor': 'john.doe@example.com',
    'tiempo': stopwatch.elapsedMilliseconds
  });

  stopwatch.reset();
  stopwatch.start();
  await tester.enterText(find.widgetWithText(TextFormField, 'Contraseña'), 'password');
  stopwatch.stop();
  acciones.add({
    'acción': 'Ingresar contraseña',
    'valor': 'password',
    'tiempo': stopwatch.elapsedMilliseconds
  });

  // Simulación: Presionar el botón de registro
  stopwatch.reset();
  stopwatch.start();
  await tester.tap(find.widgetWithText(ElevatedButton, 'Registrar'));
  await tester.pumpAndSettle();
  stopwatch.stop();
  acciones.add({
    'acción': 'Presionar botón de registro',
    'tiempo': stopwatch.elapsedMilliseconds
  });

  // -----------------------------------------------------
  // Fin de simulación y evaluación del rendimiento

  // Generación del informe detallado
  print('\nInforme de rendimiento:');
  acciones.forEach((accion) {
    if (accion.containsKey('valor')) {
      print(' - ${accion['acción']}: ${accion['valor']} - ${accion['tiempo']} ms');
    } else {
      print(' - ${accion['acción']}: ${accion['tiempo']} ms');
    }
  });
});













  group('Pruebas de Aceptación - Registro de Usuario', () {
    
    testWidgets('Registro fallido con datos inválidos', (WidgetTester tester) async {
      // Construye la pantalla RegisterScreen
      await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

      // Encuentra los TextFormField por su labelText
      Finder identificationField = find.widgetWithText(TextFormField, 'Identificación');
      Finder nameField = find.widgetWithText(TextFormField, 'Nombre');
      Finder emailField = find.widgetWithText(TextFormField, 'Correo electrónico');
      Finder passwordField = find.widgetWithText(TextFormField, 'Contraseña');
      Finder registerButton = find.widgetWithText(ElevatedButton, 'Registrar');

      // Ingresa texto inválido o vacío en cada campo
      await tester.enterText(identificationField, '');
      await tester.enterText(nameField, 'John Doe');
      await tester.enterText(emailField, 'null');
      await tester.enterText(passwordField, 'password');

      // Toca el botón de registro y espera que aparezcan mensajes de error
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      // Verifica que los mensajes de error se muestren correctamente
      expect(find.text('Por favor ingresa tu identificación'), findsOneWidget);
      expect(find.text('Por favor ingresa tu nombre'), findsNothing); // Nombre válido, no debería mostrar error
      expect(find.text('Ingresa un correo electrónico válido'), findsOneWidget);
      expect(find.text('Ingresa una contraseña válida'), findsNothing); // Contraseña válida, no debería mostrar error
    });
  });
}

