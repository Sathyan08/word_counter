class WordCounter < Struct.new(:string)

  def self.execute(string)
    new(string).count_words
  end

  def count_words
    words.each do |word|
      formatted_word = formatted_word(word)
      word_count[formatted_word] += 1
    end

    word_count.sort_by { |word, frequency| [-frequency, word] }.to_h
  end

  private

  def formatted_word(word)
    word.downcase.strip.gsub(/\W/, '')
  end

  def words
    @words ||= string.split(' ')
  end

  def word_count
    @word_count ||= Hash.new(0)
  end
end
