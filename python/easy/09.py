Q- Defanging an IP Address.
class Solution:
    def defangIPaddr(self, address: str) -> str:
        split_str = address.split(".")
        ans = "[.]".join(split_str)
        return ans
