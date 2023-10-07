class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def recent_post
    Post.where(author_id: id).limit(3).order(created_at: :desc)
  end

  def all_post
    Post.where(author_id: id).order(created_at: :desc)
  end

  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
