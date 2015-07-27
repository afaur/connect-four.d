module test_player;

public import player;

import dunit;

class TestPlayer
{
  mixin UnitTest;

  @Test
  void test_player_has_name() {
    auto player = new Player("jim", "green");
    assertEquals(player.name, "jim");
  }

  @Test
  void test_player_has_color() {
    auto player = new Player("jim", "green");
    assertEquals(player.color, "green");
  }
}
