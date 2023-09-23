class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  def update_like_counter
    num = Post.find_by(id: post_id).likes_counter.to_i
    Post.find_by(id: post_id).update(likes_counter: num + 1)
  end
end
