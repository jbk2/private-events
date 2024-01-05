module ApplicationHelper
require 'byebug'

  def on_these_paths?(arr)
    arr.each do |p|
      return true if current_page?(p)
    end
    return false
  end

end