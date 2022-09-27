class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead
      auditions.find_by(hired:true) || "No actor has been hired for this role"
    end
end