class FavoriteMailer < ActionMailer::Base
  default from: "nnpena@outlook.com"

    def new_comment(user, post, comment)

      headers["Message-ID"] = "<comments/#{comment.id}@bloccit.com>"
      headers["In-Reply-To"] = "<post/#{post.id}@bloccit.com>"
      headers["References"] = "<post/#{post.id}@bloccit.com"

      @user = user
      @post = post
      @comment = comment

      mail(to: user.email, subject: "New comment on #{post.title}")
    end
end
