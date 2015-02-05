module VotesHelper

  def up_vote_link_classes(post)

  if current_user.voted(post) && current_user.voted(post).up_vote?
    "glyphicon glyphicon-chevron-up vote"
  else 
    "glyphicon glyphicon-chevron-up"
  end
  end

  def down_vote_link_classes (post)
  if current_user.voted(post) && current_user.voted(post).down_vote?
    "glyphicon glyphicon-chevron-down vote"
  else 
    "glyphicon glyphicon-chevron-down"
  end
  end

end