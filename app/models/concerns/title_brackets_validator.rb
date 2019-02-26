class TitleBracketsValidator < ActiveModel::Validator
  BRACKET_SYMBOLS = {
    '(' => ')',
    '[' => ']',
    '{' => '}'
  }.freeze

  def validate(record)
    @record = record

    validate_emptiness
    validate_brackets
  end

  private

  attr_reader :record

  def validate_emptiness
    add_emptiness_error if record.title.empty?
  end

  def validate_brackets
    opening_brackets = []
    content = []

    record.title.each_char do |char|
      if closing_bracket?(char) && content.empty?
        add_brackets_error
        break
      end

      if opening_bracket?(char)
        opening_brackets.push char
        content.clear
      else
        content.push char
      end

      if opening_bracket_for(char) && opening_bracket_for(char) != opening_brackets.pop
        add_brackets_error
        break
      end
    end

    add_brackets_error unless opening_brackets.empty?
  end

  def opening_bracket_for(char)
    BRACKET_SYMBOLS.key(char)
  end

  def opening_bracket?(char)
    BRACKET_SYMBOLS.key?(char)
  end

  def closing_bracket?(char)
    opening_bracket_for(char).present?
  end

  def add_emptiness_error
    record.errors.add(:title, 'title should not be empty')
  end

  def add_brackets_error
    record.errors.add(:title, 'title should have, if any, only closed, not empty braces')
  end
end
