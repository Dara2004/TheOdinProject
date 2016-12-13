# > caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"
def caesar_cipher(string, key)
    alphabet = ('a'..'z')  #wrap z to a
    letters = string.split("")
    # p letters

    letters.map do |letter|
      if alphabet.include? (letter.downcase)
        key.times {letter = letter.next}
      end
      print letter[-1]
    end
end
caesar_cipher("What a string!", 5)
caesar_cipher("Testing", 4)
# Bmfy f xywnsl!
