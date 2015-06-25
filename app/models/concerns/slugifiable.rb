module Slugifiable 
  
  #module ClassMethods
  #end
  
  module InstanceMethods
    def to_slug
      self.name.downcase.gsub(" ", "-")
    end # end method
  end # end instance method

end # end module