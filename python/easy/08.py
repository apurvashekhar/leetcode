Q- Concatenation of Array
class Solution:
    def getConcatenation(self, nums: List[int]) -> List[int]:
        idx = 0
        ans = []
        for i in range( len(nums) * 2):
            if i < len(nums):
                ans.append(nums[i])
                i = i + 1
            else:
                ans.append(nums[i-len(nums)])
        return ans
