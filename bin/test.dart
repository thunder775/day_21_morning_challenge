import 'package:test/test.dart';
import 'main.dart';
main() {
  test('robot movements', () {
    //normal case
    expect(trackRobot([20, 30, 10, 40]) , [-10, 10]);
    expect(trackRobot([ ]), [0,0]);
  });
}