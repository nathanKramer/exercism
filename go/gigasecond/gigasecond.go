package gigasecond

// import path for the time package from the standard library
import "time"

const gigasecond = time.Second * 1_000_000_000

// AddGigasecond should have a comment documenting it.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(gigasecond)
}
