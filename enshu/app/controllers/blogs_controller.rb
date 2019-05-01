class BlogsController < ApplicationController
  #show, edit, updateが実行される場合のみ、メソッド実行前にset_blogを実行する
  before_action:set_blog, only:[:show, :edit, :update, :destroy]
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"  
  end
  
  
  
  def index
    #全てのブログを取得、全てのレコードをインスタンス変数に入れる
    @blogs=Blog.all
    #ブレーク
    #binding.pry
  end

  def new
    @blog=Blog.new
  end

  #new画面からconfirmへ
  def confirm
    @blog = Blog.new(blog_params)
  end

  def create
    #Blog.create(title:params[:blog][:title], content:params[:blog][:content])
    #マスアサイン
    #Blog.create(params[:blog])
    #Strong parameter   blogをマスアサインしてtitleとcontentのみへのアクセスを許可する
    #Blog.create(params.require(:blog).permit(:title, :content))
    #ストロングパラメータメソッド使用
    #Blog.create(blog_params)
    
    #ストロングパラメータ使用
    @blog = Blog.new(blog_params)
    if @blog.save      #validation結果応じた分岐をさせる
       redirect_to blogs_path, notice: "ブログを作成しました！"
    else
            # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  def edit
    #@blog = Blog.find(params[:id])
    #共通処理化
    #set_blog
  end

  def update
    #ブログのIDを取得
    #@blog = Blog.find(params[:id])
    #共通処理化
    #set_blog

    #ストロングパラメータ
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  def show
    #クリックされた詳細リンクのidを取得する
    #@blog=Blog.find(params[:id])
    #共通処理か
    #set_blog
  end
  

  private
  #ストロングパラメータ　メソッド化
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  
  #共通処理化
  # idをキーとして値を取得するメソッド
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
end