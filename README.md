###パーソナルトレーナーの顧客管理アプリ
##フリーのパーソナルトレーナーが顧客管理を行えるアプリケーション
- ペルソナ
20代パーソナルトレーナー。複数店舗で常時３〜５名の顧客を持つ。各顧客は週１〜２回セッションを行う。
各顧客のメニューはバラバラで管理方法は紙。セッション中はサポートや手本を見せることがある。
次回予約などは手帳で管理。フォーム撮影を行うために、スマホを持ち歩く。

- ペルソナが抱える問題
月単位で顧客が変わる、かつ複数店舗を移動するため、顧客管理が大変。
メニュー管理を紙で行うため、忘れることや紛失のリスクがある。
セッション中、手帳を持ち歩きながらサポートするため、手帳をどこかに置き忘れることがある。
次回予約を手帳で管理するが、スマホのカレンダーにも表示させたいため、手間が増える。

- 解決策
顧客管理に特化したアプリがあれば、顧客管理が楽にできる。
顧客情報とメニューを一元管理することで、紙でメニューを管理する手間が省くことができる。

##機能紹介
- 顧客管理機能
- トレーニングメニュー管理機能


##今後実装予定
- スケジュール管理機能追加（顧客の次回予約などを管理できる機能）
- カレンダー表示　＋　カレンダー上にスケジュール機能
- 顧客の体重などの変化をグラフ化する機能
- UIの改善（javascript、CSS、HTMLを学習し、体の画像を載せて体のパーツにカーソルを合わせる対象メニューが表示できる等）
- リファクタリングによるコードの可読性向上

##Trainersテーブル(devise)

| Columns                   | Types          | Option                     |
| --------------------------|----------------| ---------------------------|
| name                      |   string       | null: false                |
| area                      |   string       | null: false                |
| belonging                 |   string       | null: false                |
| genre                     |   string       | null: false                |
| birthday                  |   date         | null: false                |
| email                     |   date         | null: false                |
| encrypted_password        |   string       | null: false                |

###Association
- has_many :customers

##clientsテーブル

| Columns             | Types          | Option                     |
| --------------------|----------------| ---------------------------|
| name                |   string       | null: false                |
| age                 |   integer      | null: false                |
| sex                 |   boolean      | null: false                |
| purpose             |   text         | null: false                |
| weakness            |   text         | null: false                |
| belonging           |   string       | null: false                |
| session_day         |   date         | null: false                |
| session_time        |   time         | null: false                |
| remarks             |   text         |                            |
| user                |   references   | foreign_key: true          |

###Association
- belongs :trainer
- has_many :menus


##plansテーブル

| Columns                   | Types          | Option                     |
| --------------------------|----------------| ---------------------------|
|  title                    |   string       | null: false                |
|  description              |   text         | null: false                |
|  caution                  |   text         | null: false                |

###Association
- belongs_to :client
- has_many :plan_details


