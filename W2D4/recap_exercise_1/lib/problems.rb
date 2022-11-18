# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
require "byebug"
def all_vowel_pairs(words)
    pairs = []
    vowels = "aeiou"

    (0...words.length).each do |idx1|
        (idx1...words.length).each do |idx2|
            compare = words[idx1] + " " + words[idx2] 
            pairs << compare if vowels.split("").all? {|char| compare.include?(char)}
        end 
    end 

    pairs
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    return true if num == 2
    (2...num).each do |factor|
        if num % factor == 0
            return true
        end 
    end 

    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    array = []
    bigrams.each do |ele|
        if str.include?(ele)
            array << ele
        end
    end 

    array
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        hash = Hash.new{|k, v| k == v}

        if prc == nil
            self.each { |k, v| hash[k] = v if k == v}
            return hash
        end 

        new_hash = {}
        self.each {|k, v| new_hash[k] = v if prc.call(k, v)} 
        new_hash 
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        array_of_substrings = []
        length_substrings = []

        (0...self.length).each do |idx|
            (idx...self.length).each do |last|
                array_of_substrings << self[idx..last]
            end 
        end 

        
        if length == nil
            return array_of_substrings
        end 

        array_of_substrings.each do |substring|
            length_substrings << substring if substring.length == length
        end 

        return length_substrings
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = ("a".."z").to_a
        new_word = ""

        self.each_char.with_index do |char, idx| 
            alphabet_idx = alphabet.index(char)
            new_idx = alphabet_idx + num
            new_char = alphabet[new_idx % alphabet.length] 
            new_word = new_word + new_char
        end 

        new_word
    end
end
