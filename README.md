## パーソナルトレーナーの顧客管理アプリ
### フリーのパーソナルトレーナーが顧客管理を行えるアプリケーション
- ペルソナ  
  20~30代パーソナルトレーナー。
  複数店舗で常時３〜５名の顧客を持つ。
  各顧客は週１〜２回セッションを行う。
  顧客ごとにメニューを考案する。メニュー管理方法は紙。
  セッション中はサポートや手本を見せることがある。
  次回予約などは手帳で管理し、スマホのカレンダーにも記載する。
  フォーム撮影を行うために、スマホかタブレットを持ち歩く。

- ペルソナが抱える問題  
  月単位で顧客が変わる、かつ複数店舗を移動するため、顧客管理が煩雑。
  書類を忘れた時のために、メニューを写真で取って保存もしなければならない。また紛失のリスクがある。
  セッション中、手帳と顧客管理用紙を持ち歩きながらサポートするため、手帳をどこかに置き忘れることがある。
  次回予約を手帳で管理しているが、後でスマホのカレンダーにも記入する。記入間違いが起きたり、手間が多いと感じることがある。

- 解決策  
  顧客管理に特化したアプリで顧客情報、予約確認、メニューが一括管理できるサービスがあればペーパーレス化できる。
  顧客情報をアプリケーションで管理することで、紛失による情報漏洩がなくなる。
  アプリでメニュー管理できれば、接客中は身軽になる。（書類を持ち歩く必要がない）

## 機能紹介
- トレーナー専用ページ
- 顧客情報管理機能
- トレーニングメニュー管理機能


## 今後の実装予定
- レスポンシブ対応
- 顧客の体重グラフなど成果をグラフ化する機能
- 食事管理もできるよう、顧客情報の機能向上
- javascriptによる動的なアクションの追加
- リファクタリングによるコードの可読性向上

## 苦労したところ
- ルーティング
  MVCモデルの理解不足による、ルーティングエラー頻発に苦労しました。
  具体的にはモデルを３段ネストさせた箇所があり、パスを設定する時にidの取得に混乱し、「このidはどうやって取得するんだ？」と何度も試行錯誤しました。
  解決策としては、小まめにデバックを挟んで、意図したところにアクセスできているか、その時にどこのidが取得できているか、確認しながら進めました。時間は掛かってしまいましたが、結果的にスクールのカリキュラムで”わかったつもり”になっていた点を認知でき、解決することで定着できたと考えています。

- ユーザー目線
  実際にユーザーの意見を聞くことで、利用者側に立ってアプリケーションを作ることの難しさを感じました。
  完成後、知り合いのトレーナーに意見を聞いたところ、「さっきの画面はどうやって戻るの？」や  「あの画面ってどこから見れるの？」などの質問を多く受けました。ボタンやリンクの配置１つで解決できる内容が多かったのですが、これらの様な小さな不便さが、利用されるアプリとされないアプリの明暗を分けるのだと感じました。
  今後、制作を行う過程ではユーザーの声を意識し、機能に反映させていきたいと思います。
  

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

## plan_detailテーブル

| Columns                   | Types          | Option                     |
| --------------------------|----------------| ---------------------------|
|  subject                  |   string       | null: false                |
|  weight                   |   integer      | null: false                |
|  set                      |   integer      | null: false                |
|  rep                      |   integer      | null: false                |
|  cardio                   |   string       |                            |
|  cardio_time              |   integer      |                            |
|  plan                     |   references   | foreign_key: true          |

### Association
- belongs_to :plan
  
