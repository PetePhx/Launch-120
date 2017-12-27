=begin

Banner Class

Complete this class so that the test cases shown below work as intended. You are
free to add any methods or instance variables you need. However, do not make the
implementation details public.

You may assume that the input will always fit in your terminal window.

=end

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @message.length}-+"
  end

  def empty_line
    "| #{' ' * @message.length} |"
  end

  def message_line
    "| #{@message} |"
  end
end


# Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# Further Exploration
#
# Modify this class so new will optionally let you specify a fixed banner width at
# the time the Banner object is created. The message in the banner should be
# centered within the banner of that width. Decide for yourself how you want to
# handle widths that are either too narrow or too wide.

class Banner2
  DEFAULT_WIDTH = 80
  def initialize(message, width = nil)
    @message = message
    @width = width.nil? ? DEFAULT_WIDTH : width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end
end

banner = Banner2.new('And how can a man die better, than facing fearful odds,', 80)
puts banner

banner = Banner2.new('for the ashes of his fathers, and temples of his gods.')
puts banner

# +----------------------------------------------------------------------------------+
# |                                                                                  |
# |             And how can a man die better, than facing fearful odds,              |
# |                                                                                  |
# +----------------------------------------------------------------------------------+
# +----------------------------------------------------------------------------------+
# |                                                                                  |
# |              for the ashes of his fathers, and temples of his gods.              |
# |                                                                                  |
# +----------------------------------------------------------------------------------+
