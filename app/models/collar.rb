class Collar < ActiveRecord::Base
    

  acts_as_ordered_taggable_on :uses
end
