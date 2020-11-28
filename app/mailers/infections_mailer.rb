class InfectionsMailer < ApplicationMailer
  default from: 'notify@mymap.com'

  def warning(log)
    mail(to: @user.email, subject: '최근 2주간 확진자의 동선 중 겹친 곳이 있었어요!', body: log)
  end

  def hand_over(logs, email)
    mail(to: email, subject: "#{@user.name}님의 최근 2주 동선 정보입니다.", body: logs)
  end
end
