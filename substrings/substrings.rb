def substrings(s, arr)
  substrings_hash = {}
  str = s.downcase
  arr.each do |word|
    if str.include?(word)
      substrings_hash[word] = str.scan(/#{word}/).length  #this will count the number of times a substring appears in a given str. used ".length" cus the result of str.scan(/#{word}/) is an array
    end
  end
    p substrings_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("goiiiing", dictionary)
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
