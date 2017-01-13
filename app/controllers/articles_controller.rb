class ArticlesController < ApplicationController
  before_action :authenticate_usser!, except: [:show,:index,:publish]
  before_action :set_article, except: [:index,:new,:create]

  #GET /articles
  def index
    # Todos registros SELECT * FROM articles
    @articles = Article.paginate(page: params[:page],per_page:12).publicados.ultimos
  end
  #GET /articles/:id
  def show
    @article.update_visits_count
    @comment = Comment.new
  end

  #GET /articles/new
def new
  @article = Article.new
  @categories = Category.all
end

def edit
  @article = Article.find(params[:id])

end

#POST /articles
def create
  @article = current_usser.articles.new(article_params)
  @article.categories = params[:categories]
  if @article.save
    redirect_to @article
  else
    render :new
  end
end


def destroy
  @article.destroy
  redirect_to articles_path
end

  #PUT /article/:id
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def publish
    @article.publish!
    redirect_to @article
  end



  private

def set_article
    @article = Article.find(params[:id])
end

  def article_params
    params.require(:article).permit(:title,:body,:cover,:categories)
  end
end
