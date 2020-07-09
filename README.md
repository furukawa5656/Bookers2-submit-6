# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

やりたいことを明確にする やったこととの差























いいね機能
テーブル
id
user_id
book_id

課題3
①Bookers2にいいね機能を追加しましょう
実装する機能

コントローラ
favoritesコントローラを追加
createアクションを追加
用途：いいねを作成する
destroyアクションを追加
用途：いいねを削除する
いいねを作成, いいねを削除した後は、行う前にいた画面に遷移すること
モデル
favoriteモデルを追加
用途：ユーザーと投稿のセットでいいねをしている状態とする
ユーザーは一つの投稿に一つしかいいねできないこと
ビュー
投稿一覧画面にいいね数, いいね(する, 外す)ボタンを追加
投稿詳細画面にいいね数, いいね(する, 外す)ボタンを追加
いいねされていない記事に対しては、いいね作成ボタンを表示させる
いいねされている記事に対しては、いいね削除ボタンを表示させる





						<% if book.favorited_by?(current_user) %>
						  <td>
						  	<%= link_to book_favorites_path(book.id), method: :delete do %>
						  	<i class="fa fa-heart" aria-hidden="true" style="color: red;"></i>
						  	<%= book.favorites.count %>
						  	<% end %>
						<% else %>
						    <%= link_to book_favorites_path(book.id), method: :post do %>
						    <i class="fa fa-heart-o" aria-hidden="true"></i>
						    <%= book.favorites.count %>
						    <% end %>
						  </td>
						<% end %>









book-show
			<div class="col-xs-9 book-comment-form">
				<% @books.book_comments.each do |book_comment| %>
				  <%= attachment_image_tag book_comment.user, :profile_image, :fill, 50, 50, format: 'jpeg', fallback: "no_image.jpg", size:'40x40' %>
				  <%= book_comment.comment %>
				  <% if book_comment.user == current_user %>
				    <%= link_to "Dstroy", book_book_comment_path(book_comment.id), method: :delete%>
				  <% end %>
				<% end %>
				<%= form_for [@books, @book_comment] do |f| %>
				  <div class="">
				    <%= f.text_area :comment %>
				  </div>
				  <%= f.submit "送信" %>
				<% end %>
            </div>



                 <% if @books.errors.any? %>
                  <div id="error_explanation" class="alert alert-danger">
                    <ul>
                      <% @books.errors.full_messages.each do |message| %>
                        <li><%= message %></li>
                      <% end %>
                     </ul>
                  </div>
                <% end %>


	<% if book.favorited_by?(current_user) %>
	  <td>
	  	<%= link_to book_favorites_path(book.id), method: :delete do, remote: true %>
	  	<i class="glyphicon glyphicon-heart"></i>
	  	<%= book.favorites.count %>
	  	<% end %>
	  </td>
	<% else %>
	  <td>
	  	<%= link_to book_favorites_path(book.id), method: :post do, remote: true %>
		<i class="glyphicon glyphicon-heart-empty"></i>
		<%= book.favorites.count %>
		<% end %>
	  </td>
	<% end %>
	<td>コメント数: <%= book.book_comments.count %></td>






