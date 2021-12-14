Q- Consecutive Characters
class Solution:
    def maxPower(self, s: str) -> int:
        power = 1
        max_power = 1
        for i in range(len(s)-1):
            if s[i] == s[i+1]:
                power = power+1
                if power > max_power:
                    max_power = power
            else:
                power = 1
        return max_power
