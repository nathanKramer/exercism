module [commands]

actions = [
    (1, "wink"),
    (2, "double blink"),
    (4, "close your eyes"),
    (8, "jump"),
]

commands : U64 -> List Str
commands = \number ->
    commandList = List.walk actions [] \acc, (mask, action) ->
        if Num.bitwiseAnd number mask == mask then
            List.append acc action
        else
            acc
    if Num.bitwiseAnd number 16 == 16 then
        List.reverse commandList
    else
        commandList
