class Movie < ActiveRecord::Base

  has_many :reviews
  mount_uploader :poster, PosterUploader

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  # validates :poster_image_url, presence: true
  validates :release_date, presence: true
  # validate :release_date_is_in_the_future


  def review_average
    if reviews.count > 0
      reviews.sum(:rating_out_of_ten)/reviews.size
    else
      puts "No ratings as of yet."
    end
  end

  def self.search(search, duration)
    # duration ||= "2"
    # runtime = get_runtime_sql(duration)
    case duration.to_i
    when 1
      runtime = "runtime_in_minutes <= 90"
    when 2
      runtime = "runtime_in_minutes > 90 AND runtime_in_minutes < 120"
    when 3
      runtime = "runtime_in_minutes >= 120"
    else
      runtime = ""
    end
    search = "%" + search + "%"
    Movie.where("title LIKE ? AND #{runtime}", search)
  end

  private

  def get_runtime_sql(duration)
    case duration.to_i
    when 1
      runtime = "runtime_in_minutes <= 90"
    when 2
      runtime = "runtime_in_minutes > 90 AND runtime_in_minutes < 120"
    when 3
      runtime = "runtime_in_minutes >= 120"
    else
      runtime = ""
    end
  end

    # protected

  # def release_date_is_in_the_future
  #   if release_date.present?
  #     errors.add(:release_date, "should probably be in the future") if release_date < Date.today
  #   end
  # end


end