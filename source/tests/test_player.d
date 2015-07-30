module test_player;

public import player;

unittest
{
  import dunit.toolkit;

  auto player = Player.getMock("jim", "green");

  // Player has name
  assertEqual(player.name, "jim");

  // Player has color
  assertEqual(player.color, "green");
}
