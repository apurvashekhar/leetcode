Q- Defanging an IP Address
class Solution:
    def defangIPaddr(self, address: str) -> str:
        split_address = address.split('.')
        ans = '[.]'.join(split_address)
        return ans
