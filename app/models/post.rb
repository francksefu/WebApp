class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments

  def update_post_counter
    num = User.find_by(id: author_id).posts_counter.to_i
    User.find_by(id: author_id).update(posts_counter: num + 1)
  end

  def recent_comments
    Comment.where(post_id: id).limit(5).order(created_at: :desc)
  end

  validates :title, presence: true, length: { in: 0..250 }
  validates :comments_counter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
