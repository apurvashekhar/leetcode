Q- How Many Numbers Are Smaller Than the Current Number
class Solution:
    def smallerNumbersThanCurrent(self, nums: List[int]) -> List[int]:
        ans = list()
        for num in nums:
            num_count = 0
            for i in nums:
                if i < num:
                    num_count = num_count + 1
            ans.append(num_count)
        return ans
