class ArticleMailer < ApplicationMailer
  def new_article(article)
    @article = article

    Usser.all.each do |user|
      mail(to: user.email, subject: "Nuevo Artículo")
    end
  end
end
