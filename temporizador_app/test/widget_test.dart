import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temporizador_app/main.dart'; // Asegúrate de que la ruta sea correcta

void main() {
  testWidgets('Temporizador Widget Test', (WidgetTester tester) async {
    // Arrange: Cargar el widget MyApp
    await tester.pumpWidget(const MyApp());

    // Act: Aquí puedes realizar acciones, como iniciar el temporizador
    // Por ejemplo, encontrar y presionar el botón "Iniciar"
    final startButton = find.text('Iniciar');
    await tester.tap(startButton);
    await tester.pump(); // Para que se reflejen los cambios en la UI

    
    expect(find.text('00:00'), findsOneWidget); // Verifica que el tiempo inicial es 00:00

    
    await tester.pump(Duration(seconds: 1));

    
    expect(find.text('00:01'), findsOneWidget);
  });
}
