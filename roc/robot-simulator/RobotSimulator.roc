module [create, move]

Direction : [North, East, South, West]
Robot : { x : I64, y : I64, direction : Direction }

create : { x ? I64, y ? I64, direction ? Direction } -> Robot
create = \{ x ? 0, y ? 0, direction ? North } -> {
    x,
    y,
    direction,
}

move : Robot, Str -> Robot
move = \robot, instructions ->
    instructionBytes = Str.toUtf8 instructions
    List.walk instructionBytes robot applyInstruction

applyInstruction : Robot, U8 -> Robot
applyInstruction = \{ x, y, direction }, instruction ->
    when instruction is
        'L' ->
            newDirection =
                when direction is
                    North -> West
                    South -> East
                    East -> North
                    West -> South
            { x, y, direction: newDirection }

        'R' ->
            newDirection =
                when direction is
                    North -> East
                    East -> South
                    South -> West
                    West -> North
            { x, y, direction: newDirection }

        'A' ->
            when direction is
                North -> { x, y: y + 1, direction }
                East -> { x: x + 1, y, direction }
                South -> { x, y: y - 1, direction }
                West -> { x: x - 1, y, direction }

        _ -> { x, y, direction }

