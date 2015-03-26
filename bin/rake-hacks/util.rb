# http://misc.flogisoft.com/bash/tip_colors_and_formatting
class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end
  def bold 
    "\e[1m#{self}"
  end
  def dim 
    "\e[2m#{self}"
  end
  def underline
    "\e[4m#{self}"
  end
end
$DONE  = "Done".green.dim.underline
$READY = "Ready".green
