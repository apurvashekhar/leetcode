Q- Maximum Number of Words Found in Sentences
class Solution:
    def mostWordsFound(self, sentences: List[str]) -> int:
        max_count = None
        for sentence in sentences:
            words_list = sentence.split()
            num_words = len(words_list)
            if max_count is None or max_count < len(words_list):
                max_count = len(words_list)
        return max_count
