class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validate :is_clickbait?

  CLICKBAIT = [/Won't Believe/, /Secret/,  /Top [0-9]/,  /Guess/]


  def is_clickbait?
    if !CLICKBAIT.any? {|t| t.match(self.title)}
      errors.add(:title, "must be clickbait")
    end
  end
end
