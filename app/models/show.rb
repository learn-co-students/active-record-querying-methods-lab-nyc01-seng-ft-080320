class Show < ActiveRecord::Base

    def self.highest_rating
        Show.maximum(:rating)
    end

    def self.lowest_rating
        Show.minimum(:rating)
    end

    def self.ratings_sum
        Show.sum(:rating)
    end

    def self.shows_by_alphabetical_order
        #Show.order(name: :asc)
        Show.order(:name)
    end

    def self.popular_shows
        Show.where("rating >= ?", 5)
    end

    def self.least_popular_show
        #Show.all.min_by{|show| show.rating}
        Show.where("rating = ?", self.lowest_rating).first
    end

    def self.most_popular_show
        #Show.all.max_by{|show| show.rating}
        self.where("rating = ?", self.highest_rating).first
    end
end