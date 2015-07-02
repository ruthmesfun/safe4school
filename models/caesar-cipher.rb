def caesar_encode(string, offset)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  encoded_string = ""
  string.split("").each_with_index do |letter, index|
    if alphabet.include? string[index]
      encoded_char = alphabet.index(string[index]) + offset
      encoded_string << alphabet[encoded_char%26]
    elsif alphabet.include? string[index].downcase
      encoded_char = alphabet.index(string[index].downcase) + offset
      encoded_string << alphabet[encoded_char%26].upcase
    else
      encoded_string << string[index]
    end
  end
  return encoded_string
end

def caesar_decode(string, offset)
  return caesar_encode(string, -offset)
end
