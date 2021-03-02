pub fn raindrops(n: u32) -> String {
    let rain = [(3, "Pling"), (5, "Plang"), (7, "Plong")]
        .into_iter()
        .filter(|&(number, _)| n % number == 0)
        .map(|&(_, sound)| sound)
        .collect::<Vec<&str>>()
        .join("");
    return if rain.is_empty() { n.to_string() } else { rain };
}
