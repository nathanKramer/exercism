n = int(input())
p = 2

# While n is greater than some counter 2->infinity ^ 2
while n > p**2:
    if n % p == 0:
        print(f"Prime factor: {n}/{p}")
        n = n/p
    else:
        p += 1
print(f"Done: {n}")
