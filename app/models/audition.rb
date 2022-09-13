class Audition < ActiveRecord::Base
  # Audition#role: returns an instance of role associated with this audition
  # NOTE: By using the 'belongs_to' association, we automatically obtain the 'role()' method as a result
  belongs_to :role

  # NOTE: Therefore with the 'belongs_to' association above, the following isn't actually needed:
  # def role()
    # self.role
  # end

  # Audition#call_back will change the the hired attribute to true
  def call_back()
    self.hired = true
    self.save
  end
end
