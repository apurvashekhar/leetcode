Q-  Build Array from Permutation
class Solution:
    def buildArray(self, nums: List[int]) -> List[int]:
        ans = list()
        i = 0
        while i<=(len(nums)-1):
            ans.append(nums[nums[i]])
            i = i +1
        return ans
