Q- Shuffle String
class Solution:
    def restoreString(self, s: str, indices: List[int]) -> str:
        ans = []
        ind_dict = {}
        sort_ind = sorted(indices)
        i = 0
        while i < len(indices):
            val = s[i]
            k = indices[i]
            ind_dict[k] = val
            i = i + 1
        for i in sort_ind:
            ans.append(ind_dict[i])
        final = ("").join(ans)
        return final
