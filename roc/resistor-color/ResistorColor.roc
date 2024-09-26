module [colorCode, colors]

colorMap =
    Dict.fromList [
        ("black", 0),
        ("brown", 1),
        ("red", 2),
        ("orange", 3),
        ("yellow", 4),
        ("green", 5),
        ("blue", 6),
        ("violet", 7),
        ("grey", 8),
        ("white", 9),
    ]

colorCode : Str -> Result U64 _
colorCode = \color ->
    Dict.get colorMap color

colors : List Str
colors = Dict.keys colorMap
