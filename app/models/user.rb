class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
	has_many :comments, foreign_key: 'author_id'
	has_many :likes, foreign_key: 'author_id'

  def recent_post
    Post.where(author_id: id).limit(3).order(created_at: :desc)
  end
end
