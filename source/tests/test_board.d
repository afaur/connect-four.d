module test_board;

public import board;

import dunit;

class TestBoard
{
  mixin UnitTest;

  @Test
  void test_board() {
    auto board = new Board;
    assertEquals(1,1);
  }

}

