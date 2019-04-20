class ArticlesController < ApplicationController

    # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    before_action :authenticate_user!
    # include CanCan::Ability

    

    
    def new
        @article = Article.new


    end

    def create
        @article = Article.new(article_params)
       
        @article.save

        if @article.save
            redirect_to @article
        else
            render 'new'
        end
        
    end
       
    def show
        @article = Article.find(params[:id])
        # if user_signed_in? 
        #     can [:update, :destroy ,:read ,:write], [Article, Comment]
        # end
    end

    def index
        @articles = Article.all    
    
        # if user_signed_in? 
        #     can [:update, :destroy ,:read ,:write], [Article, Comment]
        # end
        
        authorize! :read, Article

    end

    def update
        
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end   
    
    def edit
        @article = Article.find(params[:id])
    end

    
    def destroy
        @article = Article.find(params[:id])
        
        
        if current_user == @article.user
            @article.destroy
        end
        # @article.destroy
    
        redirect_to articles_path
    end

    private 
        def article_params
            params.require(:article).permit(:title, :text ).merge(user: current_user)
            # params.User = current_user
        end

end
