class State
  VALID_LETTERS=['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','j','k','m','n','p','q','r','s','t','v','w','x','y','z']
  VALID_HOUSE_COUNT = 12
  VALID_LENGTH = 5
  POWERS=[16,8,4,2,1]
  DIGIT_TO_LETTER={0=>"0", 1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5", 6=>"6", 7=>"7", 8=>"8", 9=>"9", 10=>"a", 11=>"b", 12=>"c", 13=>"d", 14=>"e", 15=>"f", 16=>"g", 17=>"h", 18=>"j", 19=>"k", 20=>"m", 21=>"n", 22=>"p", 23=>"q", 24=>"r", 25=>"s", 26=>"t", 27=>"v", 28=>"w", 29=>"x", 30=>"y", 31=>"z"}
  LETTER_TO_DIGIT={"0"=>0, "1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9, "a"=>10, "b"=>11, "c"=>12, "d"=>13, "e"=>14, "f"=>15, "g"=>16, "h"=>17, "j"=>18, "k"=>19, "m"=>20, "n"=>21, "p"=>22, "q"=>23, "r"=>24, "s"=>25, "t"=>26, "v"=>27, "w"=>28, "x"=>29, "y"=>30, "z"=>31}

  attr_reader :rows
  attr_reader :row_scores
  attr_reader :col_scores
  attr_reader :score

  def initialize(options)
    @string = options[:string].to_s
    puts @string
    @valid = false
    parse_string
    compute_scores
  end

  def parse_string
    valid_chars = @string.split('').select {|c| VALID_LETTERS.include? c}
    return unless VALID_LENGTH == valid_chars.length
    @rows = []
    @rows = valid_chars.collect do |c|
      digit = LETTER_TO_DIGIT[c]
      POWERS.collect {|power| (digit & power > 0) ? 1 : 0}
    end
    return unless VALID_HOUSE_COUNT == @rows.flatten.inject(&:+)
    @valid = true
  end

  def valid?
    @valid
  end

  def line_score(value)
    if value >= (VALID_LENGTH / 2.0).ceil
      value
    else
      value - VALID_LENGTH
    end
  end

  def compute_scores
    @row_scores = @rows.collect do |row|
      line_score row.inject(&:+)
    end

    @col_scores = (0..VALID_LENGTH-1).collect do |col|
      line_score (0..VALID_LENGTH-1).collect {|row| @rows[row][col]}.inject(&:+)
    end

    @score = [@row_scores, @col_scores].flatten.inject(&:+)
  end
end
