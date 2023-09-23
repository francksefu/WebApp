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
end
