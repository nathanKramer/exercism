module [twoFer]

twoFer : [Name Str, Anonymous] -> Str
twoFer = \name ->
    word =
        when name is
            Anonymous -> "you"
            Name n -> n
    "One for $(word), one for me."
