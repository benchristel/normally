class HappyPath
  def initialize(happy_proc)
    @happy_proc = happy_proc
  end

  def but_if(condition)
    condition ? yield : @happy_proc.call
  end
end

module Normally
  def normally(&block)
    HappyPath.new(block)
  end
end
