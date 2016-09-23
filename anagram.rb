require 'byebug'

def first_anagram?(word1,word2)
  anagrams = word1.split("").permutation.map(&:join)
  return anagrams.include?(word2)
end

def second_anagram?(word1,word2)
  word1dup = word1.split("")

  word1.split("").each do |char1|
    word2.split('').each do |char2|
      if char1 == char2
        word1dup.delete(char1)
      end
    end
  end
  return word1dup.empty?
end

def third_anagram?(word1,word2)
  return true if word1.split("").sort == word2.split("").sort
  false
end

def bonus_bonus_anagram?(word1,word2)
  return true if word1.split("") - word2.split("") == []
  false
end

def fourth_anagram?(word1,word2)
  word_count1 = Hash.new {|h,k| h[k] = 0}
  word1.each_char do |chr|
    word_count1[chr] += 1
  end

  word_count2 = Hash.new {|h,k| h[k] = 0}
  word2.each_char do |chr|
    word_count2[chr] += 1
  end
  return true if word_count1 == word_count2
  false
end

def bonus_anagram?(word1,word2)
  word_count = Hash.new {|h,k| h[k] = 0}
  word1.each_char do |chr|
    word_count[chr] += 1
  end

  word2.each_char do |chr|
    word_count[chr] -= 1
  end
  return true if word_count.values.all?{|value| value == 0}
  false
end
