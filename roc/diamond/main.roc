# These tests are auto-generated with test data from:
# https://github.com/exercism/problem-specifications/tree/main/exercises/diamond/canonical-data.json
# File last updated on 2024-09-04
app [main] {
    pf: platform "https://github.com/roc-lang/basic-cli/releases/download/0.15.0/SlwdbJ-3GR7uBWQo6zlmYWNYOxnvo8r6YABXD-45UOw.tar.br",
}

import pf.Stdout
import pf.Arg

main =
    args = Arg.list! {}
    argResult = List.get args 1 |> Result.mapErr (\_ -> ZeroArgsGiven)
    argMap = Result.map argResult Str.toUtf8

    when argMap is
        Ok [char] if char >= 'A' && char <= 'Z' ->
            Stdout.line! (diamond char)

        _ -> Task.err (Exit 1 "Please provide a character between A and Z")

import Diamond exposing [diamond]
