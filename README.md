![トップ画面](https://github.com/akarinaakarina/fashion-setupshop/blob/main/17F5CCBD-37A3-4704-B412-93375733081A.png)
# アプリ名
FASHION-SETUPSHOP

# 概要
このアプリは、ファッション関連のお店を誰でも簡単に出店できるものです。  
また、外に買い物に行くように様々なお店に入店してお気に入りのお店や商品を探すワクワク感を味わいながら商品を購入できます。

# 本番環境
http://52.199.231.23/  
  
ログイン情報（テスト用）  
  
 ・Eメール : a@a  
 ・パスワード : aaaaa1
 
# 制作背景（意図）
このアプリを制作背景は、「ファッションが好きでお店を出店したい」と考えている人に向けて制作をしました。  
お店を出店したいと思っても実店舗を作るには手間や費用が多くかかります。また、実店舗を持たずオンラインのみで商品を売ろうと考えてもサイトの作成や運営などの手間や費用がかかります。そして、もう一つ宣伝力がなければお店を出店してもなかなか商品を見てもらえず、購入もしてもらえません。そこで、手間も初期費用もかからず簡単に今すぐお店を出店できるプラットフォームを作りたいと考えました。こうすることで、このアプリの中でお店を出店すれば自分のお店が目に止まることも多くなり宣伝力を補うことができます。また自分でお店を出店する前の練習の場として、実際に自分が作ったものがお客さんにお金を支払って頂いて購入されるという体験をして頂きたいとも思いました。  
そしてもう一つ、万人受けなどを気にせず製作者が作りたいものを作れる環境を作りたいと考えたからです。  
趣味としてや副業などとして売り上げを気にせず作りたいものを作って売るという環境を目指しました。100人中1人が良いと思って貰えれば、という商品はきっとその1人の人がその商品を見つけた時の感動はとても大きいものだと思います。この出会いが生まれてくれることを最大のコンセプトとしてこのアプリを制作致しました。

# 実装機能

### ユーザー管理機能
会員登録・ログイン・ログアウト

### 商品出品機能
画像、テキスト、ActiveHashを用いた出品データの登録
Javascriptを使用した販売手数料・利益計算

### 商品一覧機能
出品された商品のデータ、画像を商品形態ごとに分けて一覧表示

### 商品詳細表示機能
商品のデータの詳細を表示
出品者の場合は編集、削除のボタンを表示
それ以外の場合は購入ボタンを表示

### 商品情報編集機能
出品者のみ商品の編集が行える

### 商品削除機能
出品者のみ商品の削除を行える

### 商品購入機能
クレジットカード決済を行える

### 商品検索機能
商品の名前で検索を行える

### 画像プレビュー機能
Javascriptを使用した画像のプレビューを表示

### パンくずリスト機能
遷移前の画面のリンクを表示

### コメント機能
商品ごとにチャットルームを設置
出品者（製作者）とのチャットが行える

### お気に入り登録機能
出品されている商品に対してお気に入り登録を行うことができる
お気に入り登録した商品をマイページですぐに確認することができる。

# 使用技術（開発環境）
## バックエンド
Ruby.Ruby on Rails

## フロントエンド
HTML.CSS.Javascript

## データベース
MySQL.SequelPro

## インフラ
AWS(EC2).Capstrano

## Webサーバー（本番環境）
nginx

## アプリケーションサーバー（本番環境）
unicorn

## ソース管理
GitHub.GitHubDesktop

## テスト
Rspec

## エディタ
VSCode

# 今後実装したい機能
・出品する際の多階層のカテゴリーとそれに対応した検索機能  
・購入する商品の一時保留機能（カート機能）など

# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false  unique: true |
| encrypted_password   | string | null: false               |
| last_name            | string | null: false               |
| first_name           | string | null: false               |
| last_kana            | string | null: false               |
| first_kana           | string | null: false               |
| birthday             | date   | null: false               |
| shop_name            | string |                           |
| description          | text   |                           |

### Association

- has_many :original_items
- has_many :buys
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :liked_original_items, through: :likes, source: :original_item

## original_items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| description        | text        | null: false                    |
| state_id           | integer     | null: false                    |
| category1_id       | integer     | null: false                    |
| category2_id       | integer     | null: false                    |
| size_id            | integer     | null: false                    |
| color_id           | integer     | null: false                    |
| delivery_style_id  | integer     | null: false                    |
| prefecture_id      | integer     | null: false                    |
| delivery_day_id    | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false  foreign_key: true |

### Association

- has_one :buy
- belongs_to :user

## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false  foreign_key: true |
| original_item | references | null: false  foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :original_item

## address テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| postal_code     | string     | null: false                   |
| prefecture_id   | integer    | null: false                   |
| municipality    | string     | null: false                   |
| address         | string     | null: false                   |
| building_name   | string     |                               |
| phone_number    | string     | null: false                   |
| buy             | references | null: false  foreign_key: true|

### Association

- belongs_to :buy

## comments テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| user_id          | integer    | null: false                   |
| original_item_id | integer    | null: false                   |
| text             | text       | null: false                   |

### Association

- belongs_to :original_item
- belongs_to :user

## likes テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| user_id          | references | null: false  foreign_key: true|
| original_item_id | references | null: false  foreign_key: true|

### Association

- belongs_to :original_item
- belongs_to :user
