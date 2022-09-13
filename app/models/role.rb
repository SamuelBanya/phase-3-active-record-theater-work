class Role < ActiveRecord::Base
  # Role#auditions: returns all of the auditions associated with this role
  # NOTE: By using the 'has_many' association, we automatically obtain the '#auditions' method:
  has_many :auditions

  # NOTE: Therefore, the following isn't actually needed due to the 'has_many' association:
  # def auditions()
    # self.auditions
  # end

  # Role#actors: returns an array of names from the actors associated with this role
  def actors()
    # First attempt
    # self.auditions.actors
    # NOTE: Here's the docs page on the '.pluck' method:
    # https://www.rubydoc.info/docs/rails/ActiveRecord%2FCalculations:pluck
    auditions.pluck(:actor)
  end

  # NOTE: Here are the Ruby docs for the '.where()' method that you can use to create
  # a SQL statement to filter the relation you provide to it:
  # https://api.rubyonrails.org/v7.0.4/classes/ActiveRecord/QueryMethods.html#method-i-where

  # Role#locations: returns an array of locations from the auditions associated with this role
  def locations()
    # First attempt:
    # self.auditions.locations
    auditions.pluck(:location)
  end

  # Role#lead: returns the first instance of the audition that was hired for this role or returns a string 'no actor has been hired for this role'
  def lead()
  # First attempt:
  # self.auditions.actors.first()
  # Second attempt:
  # if auditions.where(auditions.role.first())
    if auditions.where(hired: true).length > 0
      auditions.where(hired: true)[0]
    else
      'no actor has been hired for this role'
    end
  end

  # Role#understudy: returns the second instance of the audition that was hired for this role
  # or returns a string 'no actor has been hired for understudy for this role'
  def understudy()
    # First attempt:
    # self.auditions.actors.last()
    # Second attempt:
    # if auditions.where(auditions.role.second())
    if auditions.where(hired: true).length > 1
      auditions.where(hired: true)[1]
    else
      'no actor has been hired for understudy for this role'
    end
  end
end
