module test_board;

public import board;

unittest
{
  import dunit.toolkit;

  // Test 1
  auto board = Board.getMock();
  assertEqual(1,1);
}
