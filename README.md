# rails_qa_app
質問・回答アプリ



## 要件

- ログインログアウト機能がある
- ユーザーはニックネームとアバター画像を登録できる
- ユーザーは質問を投稿できる
- ユーザーは自分の質問を編集・削除できる
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