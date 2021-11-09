class ArticlesController < ApplicationController
  def index
    @articles =Book.all

    @article_by_day = @articles.group_by_day(:created_at).size
    # groupdateのgroup_by_dayメソッドで投稿日(created_at)に基づくグルーピングして個数計上。 
    # => {Wed, 05 May 2021=>23, Thu, 06 May 2021=>20, Fri, 07 May 2021=>3, Sat, 08 May 2021=>0, Sun, 09 May 2021=>12, Mon, 10 May 2021=>2}

    @chartlabels = @article_by_day.map(&:first).to_json.html_safe
    # 投稿日付の配列を格納。文字列を含んでいると正しく表示されないので.to_json.html_safeでjsonに変換。
    # => "[\"2021-05-05\",\"2021-05-06\",\"2021-05-07\",\"2021-05-08\",\"2021-05-09\",\"2021-05-10\"]"

    @chartdatas = @article_by_day.map(&:second)
    # 日別投稿数の配列を格納。
    # => [23, 20, 3, 0, 12, 2]
  end
end
