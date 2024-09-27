module [create, toStr, add, subtract]

Clock : { hour : U8, minute : U8 }

create : { hours ? I64, minutes ? I64 }* -> Clock
create = \{ hours ? 0, minutes ? 0 } ->
    totalMinutes = (hours * 60 + minutes) % (24 * 60)
    normalizedMinutes =
        if totalMinutes < 0 then
            totalMinutes + 24 * 60
        else
            totalMinutes
    {
        hour: Num.intCast ((normalizedMinutes // 60) % 24),
        minute: Num.intCast (normalizedMinutes % 60),
    }

toStr : Clock -> Str
toStr = \{ hour, minute } ->
    hours = clockDigitToStr hour
    minutes = clockDigitToStr minute
    "$(hours):$(minutes)"

add : Clock, { hours ? I64, minutes ? I64 }* -> Clock
add = \clock, { hours ? 0, minutes ? 0 } ->
    create {
        hours: Num.toI64 clock.hour + hours,
        minutes: Num.toI64 clock.minute + minutes,
    }

subtract : Clock, { hours ? I64, minutes ? I64 }* -> Clock
subtract = \clock, { hours ? 0, minutes ? 0 } ->
    add clock { hours: -hours, minutes: -minutes }

### Private

clockDigitToStr : U8 -> Str
clockDigitToStr = \digit ->
    if digit < 10 then
        "0$(Num.toStr digit)"
    else
        Num.toStr digit
