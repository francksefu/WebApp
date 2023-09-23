class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :posts, class_name: 'Post', foreign_key: 'post_id'

  def update_comment_counter
    num = Post.find_by(id: post_id).comments_counter.to_i
    Post.find_by(id: post_id).update(comments_counter: num + 1)
  end
end
