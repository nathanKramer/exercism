from typing import List

def find(search_list: List[int], value: int) -> int:
    if len(search_list) == 0:
        raise ValueError("value not in array")

    index = len(search_list) // 2

    middle_item = search_list[index]

    if middle_item > value:
        return find(search_list[0:index], value)
    elif middle_item < value:
        return index + 1 + find(search_list[index + 1:], value)

    return index
