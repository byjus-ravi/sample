class ArticlesController<ApplicationController
    
    before_action :set_article,only: [:show, :edit, :update ,:destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def myarticles
        @articles=current_user.articles
    end

    def index
        @articles=Article.all
    end

    def show
    end

    def new
        @article=Article.new
    end
    def create
        @article=Article.new(article_params)
        @article.user=current_user
        if @article.save
        redirect_to @article
        else
            redirect_to new_article_path
        end
    end

    def edit
    end

    def update
      if @article.user == current_user
        @article.update(article_params)
        @article.save
        puts "hello"
        redirect_to @article
      else
        render 'edit'
      end
    end

    def destroy
        if @article.user == current_user
        @article.destroy
        redirect_to articles_path
        else
            redirect_to articles_path
        end
    end

    private
    def set_article
        @article=Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description)
    end
end