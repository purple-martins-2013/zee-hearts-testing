class Todo < ActiveRecord::Base

  def tags
    read_attribute(:tags).split(/[, ]/).reject(&:empty?)
  end

end
