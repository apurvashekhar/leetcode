Q-  Remove Vowels from a String
class Solution:
    def removeVowels(self, s: str) -> str:
        ans = " "
        for i in s.lower():
            if i in ('a','e','i','o','u'):
                continue
            else:
                ans += i
        return ans.strip()
