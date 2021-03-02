module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , defaultRobot
    , simulate
    , turnLeft
    , turnRight
    )


type Bearing
    = North
    | East
    | South
    | West


type alias Robot =
    { bearing : Bearing
    , coordinates :
        { x : Int
        , y : Int
        }
    }


defaultRobot : Robot
defaultRobot =
    { bearing = North
    , coordinates = { x = 0, y = 0 }
    }


turnRight : Robot -> Robot
turnRight robot =
    case robot.bearing of
        North ->
            { robot | bearing = East }

        East ->
            { robot | bearing = South }

        South ->
            { robot | bearing = West }

        West ->
            { robot | bearing = North }


turnLeft : Robot -> Robot
turnLeft robot =
    case robot.bearing of
        North ->
            { robot | bearing = West }

        East ->
            { robot | bearing = North }

        South ->
            { robot | bearing = East }

        West ->
            { robot | bearing = South }


advance : Robot -> Robot
advance robot =
    let
        bearingVector =
            case robot.bearing of
                North ->
                    { x = 0, y = 1 }

                East ->
                    { x = 1, y = 0 }

                South ->
                    { x = 0, y = -1 }

                West ->
                    { x = -1, y = 0 }

        newCoords =
            { x = robot.coordinates.x + bearingVector.x, y = robot.coordinates.y + bearingVector.y }
    in
    { robot | coordinates = newCoords }


simulate : String -> Robot -> Robot
simulate directions robot =
    let
        translate c =
            case c of
                'R' ->
                    turnRight

                'L' ->
                    turnLeft

                'A' ->
                    advance

                _ ->
                    identity

        transformations =
            List.map translate (String.toList directions)
    in
    List.foldl (\fn bot -> fn bot)
        robot
        transformations
