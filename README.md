### パーソナルトレーナーの顧客管理アプリ
## フリーのパーソナルトレーナーが顧客管理を行えるアプリケーション
- ペルソナ  
20代パーソナルトレーナー。複数店舗で常時３〜５名の顧客を持つ。各顧客は週１〜２回セッションを行う。
各顧客にメニューを考案する。管理方法は紙。セッション中はサポートや手本を見せることがある。
次回予約などは手帳で管理。フォーム撮影を行うために、スマホを持ち歩く。

- ペルソナが抱える問題  
月単位で顧客が変わる、かつ複数店舗を移動するため、顧客管理が煩雑。
メニュー管理を紙で行うため、忘れた時に困る。また紛失のリスクがある。
セッション中、手帳を持ち歩きながらサポートするため、手帳をどこかに置き忘れることがある。
次回予約を手帳で管理するが、スマホのカレンダーにも記入するため、手間が多い。

- 解決策  
顧客管理に特化したアプリで顧客情報、予約確認、メニューが一括管理できるサービスがあればペーパーレスできる。
顧客情報をアプリケーションで管理することで、紛失しても顧客情報が漏洩する心配が減る。
アプリでメニュー管理できれば、接客中は身軽になる。（手帳を持ち歩く必要がない）

## 機能紹介
- トレーナー専用ページ
- 顧客管理機能
- トレーニングメニュー管理機能


## 今後実装予定
- レスポンシブ対応
- 顧客の体重などの変化をグラフ化する機能
- 食事管理もできるよう、顧客情報の機能向上
- リファクタリングによるコードの可読性向上

## Trainersテーブル(devise)

| Columns                   | Types          | Option                     |
| --------------------------|----------------| ---------------------------|
| name                      |   string       | null: false                |
| area                      |   string       | null: false                |
| belonging                 |   string       | null: false                |
| genre                     |   string       | null: false                |
| birthday                  |   date         | null: false                |
| email                     |   date         | null: false                |
| encrypted_password        |   string       | null: false                |

### Association
- has_many :customers

## clientsテーブル

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

### Association
- belongs :trainer
- has_many :menus


## plansテーブル

| Columns                   | Types          | Option                     |
| --------------------------|----------------| ---------------------------|
|  title                    |   string       | null: false                |
|  description              |   text         | null: false                |
|  caution                  |   text         | null: false                |
|  client                   |   references   | foreign_key: true          |

### Association
- belongs_to :client
- has_many :plan_details


