def regex_converter(dirty_word_array)
  dirty_regex = []

  dirty_word_array.each do |word|
    
    new_word = Regexp.new word+"/i"
    dirty_regex <<  new_word
  end
  return dirty_regex
end
  
def dirty_word_counter(lyrics, dirty_word_array)
  curse_list = []
  lyric_list = lyrics.split(" ")
  dirty_word_array.each do |dirty_word|
    lyric_list.each do |lyric|
      curse_list << dirty_word if lyric.downcase.include? dirty_word
      end
    end
  return curse_list.count
end


test_lyrics = "Thats why yo bitch won't a real nigga like me [x2]
She won't to give that pussy still nigga like me [x2]
I be pimpin them hoes, i be pimpin them hoes, i be pimpin them hoes pimp pimpin them hoes 
I be workin them bitches, i be workin them bitches, i be workin them bitches work workin them bitches"

dirty_wordz = ["bitch", "pussy", "nigga", "hoe"]

dirty_word_counter(test_lyrics, dirty_wordz)