class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :song
  before_save :update_total_score

  private
  def update_total_score
    self.song.total_score = recalculate_total_score self.song.rating_number,
      self.song.total_score, self.score
    self.song.rating_number += 1
    self.song.save
  end

  def recalculate_total_score rating_number, total_score, new_score
    (rating_number * total_score + new_score) / (rating_number + 1)
  end
end
