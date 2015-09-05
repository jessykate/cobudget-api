class UserMailer < ActionMailer::Base
  def invite_email(user, inviter, group, tmp_password)
    @user = user
    @inviter = inviter
    @tmp_password = tmp_password
    @group = group
    mail(to: user.name_and_email,
        from: inviter.name_and_email,
        subject: "#{inviter.name} invited you to join \"#{group.name}\" on Cobudget")
  end

  def invite_to_group_email(user, inviter, group)
    @user = user
    @inviter = inviter
    @group = group
    mail(to: user.name_and_email,
        from: inviter.name_and_email,
        subject: "#{inviter.name} invited you to join \"#{group.name}\" on Cobudget")
  end

  def notify_author_of_new_comment_email(comment: )
    @comment = comment
    @project = @comment.bucket
    @author = @project.user
    @commenter = @comment.user
    @group = @project.group
    mail(
      to: @author.email,
      from: "admin@cobudget.co",
      subject: "[Cobudget - #{@group.name}] #{@commenter.name} has commented on your project." 
    )
  end

  def notify_funders_and_commenters_of_new_comment_email

  end
end