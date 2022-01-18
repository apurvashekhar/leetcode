Q-  Number of Steps to Reduce a Number to Zero
class Solution:
    def numberOfSteps(self, num: int) -> int:
        count = 0
        while num != 0:
            if num % 2 == 0:
                num = int(num / 2)
                count = count + 1
            if num % 2 != 0:
                num = num - 1
                count = count + 1
        return count
