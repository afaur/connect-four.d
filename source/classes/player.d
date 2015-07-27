module player;

import dunit.mockable;

public class Player {

  public string name;

  public string color;

  this(string name, string color) {
    this.name = name;
    this.color = color;
  }

  mixin Mockable!(Player);
}

