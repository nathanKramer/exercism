defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    %{
      :direction => direction,
      :position => position
    }
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: Map, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    case instructions do
      "L" -> turn(robot, instructions)
      "R" -> turn(robot, instructions)
      "A" -> advance(robot)
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: Map) :: atom
  def direction(robot) do
    robot[:direction]
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: Map) :: {integer, integer}
  def position(robot) do
    robot[:position]
  end

  defp turn(robot, turn_direction) do
    compass = [:north, :east, :south, :west]
    heading = Enum.find_index(compass, fn d -> d == robot[:direction] end)

    heading =
      case turn_direction do
        "L" -> Integer.mod(4, heading - 1)
        "R" -> Integer.mod(4, heading + 1)
      end

    Map.put(robot, :direction, compass[heading])
  end

  @spec advance(robot :: Map) :: Map
  defp advance(robot) do
    new_pos =
      case robot[:direction] do
        :north -> add(robot[:position], {0, 1})
        :east -> add(robot[:position], {1, 0})
        :south -> add(robot[:position], {0, -1})
        :west -> add(robot[:position], {-1, 0})
      end

    Map.put(robot, :position, new_pos)
  end

  defp add({a, b}, {a2, b2}) do
    {a + a2, b + b2}
  end
end
