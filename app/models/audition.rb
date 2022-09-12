class Audition < ActiveRecord::Base
  # Audition#role: returns an instance of role associated with this audition
  def role()
    self.role()
  end

  # Audition#call_back will change the the hired attribute to true
  def call_back()
    self.hired = true
  end
end
