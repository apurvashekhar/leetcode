Q - Kids With the Greatest Number of Candies
class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        highest_candy = max(candies)
        ans = []
        for i in candies:
            if i + extraCandies >= highest_candy:
                ans.append(True)
            else:
                ans.append(False)
        return ans
