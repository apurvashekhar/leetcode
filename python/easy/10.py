Q - Final Value of Variable After Performing Operations
class Solution:
    def finalValueAfterOperations(self, operations: List[str]) -> int:
        x = 0
        for i in operations:
            if i == 'X++':
                x = x + 1
            if i == "++X":
                x = x + 1
            if i == "X--":
                x = x -1
            if i == "--X":
                x = x -1
        return x
