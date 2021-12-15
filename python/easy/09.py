Q- Richest Customer Wealth
class Solution:
    def maximumWealth(self, accounts: List[List[int]]) -> int:
        max_wealth = None
        for i in accounts:
            if max_wealth == None or max_wealth <= sum(i) :
                max_wealth = sum(i)
        return max_wealth
