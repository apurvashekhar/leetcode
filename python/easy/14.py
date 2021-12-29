Q- Subtract the Product and Sum of Digits of an Integer
class Solution:
    def subtractProductAndSum(self, n: int) -> int:
        sum_ans = None
        prod_ans = None
        for i in str(n):
            if sum_ans == None:
                sum_ans = int(i)
                prod_ans = int(i)
            else:
                sum_ans = sum_ans + int(i)
                prod_ans = prod_ans * int(i)
        ans = prod_ans-sum_ans
        return ans
