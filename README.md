# rails_qa_app
質問・回答アプリ



## 要件

- ログインログアウト機能がある
- ユーザーはニックネームとアバター画像を登録できる
- ユーザーは質問を投稿できる
- ユーザーは自分の質問を編集・削除できる
- ユーザーは質問を解決済み状態に変更できる
- ユーザーは質問に対して回答ができる
- ユーザーは質問を検索できる
- 質問があった際に全員に対して質問があった旨をメールで通知する（ただし自分は除く）
- 質問に対して回答があった場合は質問者および当該質問に回答したユーザーに対してメールで通知する。（ただし自分は除く）
- 質問はページングできる
- 管理画面がある
- 管理画面へは権限を付与されたユーザーしか入れない
- 管理画面では全てのリソースを削除できる



## テーブル定義

- **users**
  - id: integer
  - name: string
  - email: string
  - password_digest: string
  - admin: boolean
  - created_at: datetime
  - updated_at: datetime



- **questions**
  - id: integer
  - title: string
  - content: text
  - solved: boolean
  - user_id: integer
  - created_at: datetime
  - updated_at: datetime



- **answers**
  - id: integer
  - content: text
  - question_id: integer
  - user_id: integer
  - created_at: datetime
  - updated_at: datetime



- **active_storage_attachments**
  - id: integer
  - name: string
  - record_id: integer
  - record_type: string
  - blob_id: integer
  - created_at: datetime



- **active_storage_blobs**
  - id: integer
  - key: string
  - filename: string
  - content_type: string
  - metadata: text
  - byte_size: bigint
  - checksum: string
  - created_at: datetime



## エンドポイント・コントローラ設計

| やりたいこと                     | メソッド | エンドポイント         | コントローラ#アクション |
| -------------------------------- | -------- | ---------------------- | ----------------------- |
| ユーザー登録画面を表示           | GET      | /users/new             | users#new               |
| ユーザー登録をする               | POST     | /users                 | users#create            |
| ログイン画面を表示               | GET      | /login                 | sessions#new            |
| ログインする                     | POST     | /login                 | sessions#create         |
| 質問一覧を表示（全て）           | GET      | /questions             | questions#index         |
| 質問一覧を表示（未解決）         | GET      | /questions?solved=0    | questions#index         |
| 質問一覧を表示（解決済み）       | GET      | /questions?solved=1    | questions#index         |
| 質問投稿ページを表示             | GET      | /questions/new         | questions#new           |
| 質問投稿をする                   | POST     | /questions             | questions#create        |
| 質問詳細を表示する               | GET      | /questions/:id         | questions#show          |
| 質問編集ページを表示             | GET      | /questions/:id/edit    | questions#edit          |
| 質問を更新する                   | PATCH    | /questions/:id         | questions#update        |
| 質問を削除する                   | DELETE   | /questions/:id         | questions#destroy       |
| 回答する                         | POST     | /questions/:id/answers | answers#create          |
| ユーザ一覧を表示                 | GET      | /users                 | users#index             |
| 管理画面用のログインページ表示   | GET      | /admin/login           | admin/sessions#new      |
| (管理画面)質問一覧ページ表示     | GET      | /admin/questions       | admin/questions#index   |
| (管理画面)質問を削除する         | DELETE   | /admin/questions/:id   | admin/questions#destroy |
| (管理画面)ユーザー一覧ページ表示 | GET      | /admin/users           | admin/users#index       |
| (管理画面)ユーザーを削除する     | DELETE   | /admin/users/:id       | admin/users#destroy     |

