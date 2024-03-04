# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
   @candidates.each do |candidate|
    return candidate if candidate[:id] == id
   end
   nil
  end
  
  def experienced?(candidate)
    candidate [:years_of_experience] >= 2
  end
  
  def qualified_candidates(candidates)
    @candidates.each do |candidate|
      if candidate[:years_of_experience] >= 2 &&
        candidate[:github_points] >= 100 &&
        (candidate[:languages] == 'Ruby' || candidate[:languages] == 'Python') &&
        candidate[:date_applied] <= 15.days.ago.to_date &&
        candidate[:age] > 17

        qualified << candidate
      end
    end
    qualified
  end
  
  # More methods will go below

  def ordered_by_qualificaitons(candidates)
    @candidates.sort_by do |candidate|
      [-candidate[:years_of_experience], -candidate[:github_points]]
    end
  end
