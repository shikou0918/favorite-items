# README

# Favorite Items

就職活動用のポートフォリオとして制作した自作アプリです。

自分のお気に入りのアイテムを紹介する投稿アプリです。
![Uploading favorite-items.jpg…]()



# URL

https://www.favorite-items.net/

ログインページからゲストユーザーとしてE-mail、パスワード等を記入せず簡単にログインすることができます。


# 制作背景

私自身服や小物等が好きで、投稿者同士お気に入りのアイテムを共有できるアプリがあれば良いなという想いでこのアプリを作成しました。


# 使用技術

##### フロントエンド

- Haml
- Sass
- jQuery 

##### バックエンド

- Ruby 2.5.1
- Ruby on Rails 5.0.7.2

##### サーバー

- Nginx 1.16.1

##### データベース

- MySQL 5.6.47

##### インフラ・開発環境等

- AWS（VPC, EC2, S3, Route53, ALB, ACM）

- Capistrano

- RSpec


##### AWS構成図
![AWS構成図](https://user-images.githubusercontent.com/57096841/81496540-4cb72280-92f3-11ea-83d9-752b1d7124fa.png)


# 実装機能

- ユーザー管理機能(deviseを使用)
  - 新規登録・ログイン・ログアウト機能
  - マイページ・登録情報編集
- 投稿機能
  - 投稿一覧
  - 投稿詳細
  - 投稿編集
  - 投稿削除(Ajax)

- コメント機能(Ajax)
- いいね機能(Ajax)
  - いいね数に応じたランキング機能
- フォロー・フォロワー機能
- あいまい検索機能
- ページネーション機能(kaminariを使用)


# 今後実装予定の内容

- 複数画像投稿機能
- Dockerの導入