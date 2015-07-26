module test_board;

public import board;

//import helpers;
import dunit;

class TestBoard
{
  mixin UnitTest;

  @Test
   void board() {
    auto board = new Board;
    //string[4] fruits = ["banana", "mango", "apple", "orange"];
    //assertEquals(fruits[0], "banana");
    //assertEquals(fruits.length, 4);
    //int[5] b = 1; // 5 elements with same value 1
    //assertEquals(b, [1,1,1,1,1]);
    assertEquals(1,1);
  }

}

