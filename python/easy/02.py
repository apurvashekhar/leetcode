Q-  Running Sum of 1d Array
class Solution:
    def runningSum(self, nums: List[int]) -> List[int]:
        ans = []
        idx = 0
        for i in nums:
            new_list = nums[:idx+1]
            ans.append(sum(new_list))
            idx = idx +1
        return ans
