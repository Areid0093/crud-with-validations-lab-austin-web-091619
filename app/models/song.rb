class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name], 
    message: "Cannot be repeated by the same artist in the same year."
}
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [true, false] }

    with_options if: :released do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
        only_integer: true, less_than_or_equal_to: Date.current.year
        }
    end
end
