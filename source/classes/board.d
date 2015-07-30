module board;

import std.stdio;
import std.conv;
import std.array;
import std.algorithm.sorting;
import std.algorithm.iteration;
import std.functional;
import colorize : fg, color, cwriteln, cwritefln;

import dunit.mockable;

public import player;

public class Board {
  public int[7][6] board;
  public Player[3] players;
  this() {
    this.board = [
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0]
    ];
    this.players = [
      new Player("Null", "black"),
      new Player("Adam", "red"),
      new Player("Blaine", "yellow")
    ];
  }

  void play() {
    for (int i = 0; i <= 3;i++) {
      write("Where do you want to go: ");
      int input;
      readf("%d", &input);
      readln();
      place(input, (i % 2 == 0) ? 1 : 2);
      draw();
      write(won());
    }
  }

  void draw() {
    foreach (int[] row; this.board) {
      foreach (int piece; row) {
        write("\u25A0".color(this.players[piece].color));
      }
      writeln();
    }
  }

  void place(int position, int playerid) {
    foreach_reverse (int[] row; this.board) {
      if (row[position] == 0) {
        row[position] = playerid;
        return;
      }
    }
    // oh shit
    return;
  }

  bool won() {
    for(int row = 0;row < this.board.length; row++) {
      for(int col = 0;col < this.board[row].length; col++) {
        if (point_won(row, col)) {
          return true;
        }
      }
    }
    return false;
  }

  bool point_won(int row, int column) {
    foreach (int[] items; possible_wins(row, column)) {
      if (items[0] != 0 && items.uniq!("a == b").array.length == 1) {
        return true;
      }
    }
    return false;
  }

  int[][] possible_wins(int row, int column) {
    /**
    directions = {n: [-1, 0], w: [0, -1], nw: [-1, -1], ne: [-1, 1]}
    directions.keys.map do |direction|
      relative_direction = directions[direction]
      (0..3).map do |i|
        x = row + (relative_direction[0] * i)
        y = column + (relative_direction[1] * i)
        pieces[x][y] if x >= 0 and y >= 0
      end
    end
    */
    return [
      [0, 0, 0, 0],
      [1, 1, 0, 1],
      [1, 0, 1, 1],
      [0, 1, 1, 1]
    ];
  }

  mixin Mockable!(Board);
}
