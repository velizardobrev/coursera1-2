#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class. 
  #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  #* content          - the string analyzed (provided)
  #* line_number      - the line number analyzed (provided)
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  def initialize(content, line_number)
  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
    @content = content

    @line_number = line_number
    #* call the calculate_word_frequency() method. 
    self.calculate_word_frequency(content) #calling
  end

#* calculate_word_frequency() - calculates result
 def calculate_word_frequency(content)

  frequency = Hash.new(0)
  content.split.each do |word| 
  frequency[word.downcase] += 1 
    #Implement the calculate_word_frequency() method to:
    #* calculate the maximum number of times a single word appears within
    #  provided content and store that in the highest_wf_count attribute.
    #* identify the words that were used the maximum number of times and
    #  store that in the highest_wf_words attribute.
   end
    @highest_wf_count = frequency.values.max
    @highest_wf_words = frequency.select { |k, val| val == @highest_wf_count }.keys
  end
end



#  Implement a class called Solution. 
class Solution

  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute 
  #  equal to the highest_count_across_lines determined previously.
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' into an array of LineAnalyzers and stores them in analyzers.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and 
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in 
  #  highest_count_words_across_lines in the specified format
  #$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format

  def initialize()
    @analyzers = []
  end

  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  def analyze_file()
    lines = File.foreach('test.txt')
    lines.each_with_index { |line, index| @analyzers << LineAnalyzer.new(line, index) }
  end

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

  def calculate_line_with_highest_frequency()
    @highest_count_across_lines = 0
    @highest_count_words_across_lines = Array.new
    @analyzers.each do |element|
      if element.highest_wf_count > @highest_count_across_lines
        @highest_count_across_lines = element.highest_wf_count
      end
    end
    @analyzers.each do |element|
    @highest_count_words_across_lines << element if element.highest_wf_count == @highest_count_across_lines
    end
  end

  def print_highest_word_frequency_across_lines()
    @highest_count_words_across_lines.each { |element| puts "#{element.highest_wf_words} (appears in line #{element.line_number})"}
  end
end

########################################################################################
#console tests
########################################################################################
#line analyzer tests
#initialize() test
#line1 = LineAnalyzer.new(1,"bla bla bla bla bla")
#puts line1.line_number
#puts line1.content