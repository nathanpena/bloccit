class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  default_scope {order('updated_at ASC') }

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true

  after_save :send_favorite_emails

  private

  def send_favorite_emails
    post.favorites.each do |favorite|
      if should_receive_update_for?(favorite)
        FavoriteMailer.new_comment(favorite.user, post, self).deliver
      end
    end
  end
  
  def should_receive_update_for?(favorite)
   favorite.user.email_favorites? && (user.id != favorite.user.id)
  end
end
