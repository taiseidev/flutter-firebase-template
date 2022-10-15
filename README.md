# flutter_firebase_template

flutter✖︎firebaseのサンプルをまとめたプロジェクト

## SNS機能

### データスキーム

## コレクション一覧

|  コレクション名  |  説明  |
| ---- | ---- |
|  users  |  user情報を管理  |
|  myPosts  |  自分の投稿一覧  |
|  timelines  |  タイムラインに表示される投稿  |
|  follows  |  フォローしているユーザー一覧  |
|  followers  |  フォローワー一覧  |
|  posts  |  投稿一覧  |
|  likeUsers  |  お気に入りしているユーザー  |

## users

- Authのuuid

|  フィールド名  |  型  |
| ---- | ---- |
|  name  |  String  |
|  imageUrl  |  String  |
|  followCount  |  Int  |
|  followerCount  |  Int  |
|  myPostCount  |  Int  |
|  createdAt  |  Timestamp  |
|  updatedAt  |  Timestamp  |

＊ countの更新についてはCloud Functionsを使用して更新する

## myPosts

- postId

|  フィールド名  |  型  |
| ---- | ---- |
|  userId  |  String  |
|  createdAt  |  Timestamp  |

## timeline

- postId

|  フィールド名  |  型  |
| ---- | ---- |
|  userId  |  String  |
|  createdAt  |  Timestamp  |

＊ timeline更新についてはCloud Functionsを使用して更新する<br>
＊ 追加と削除でそれぞれ4つのトリガーを設定
   - フォローしているユーザーが投稿したとき(追加)
   - フォローしているユーザーが投稿を削除したとき(削除)
   - 新しくユーザーをフォローしたとき(追加)
   - フォローを解除したとき(削除)


## follows

- userId

|  フィールド名  |  型  |
| ---- | ---- |
|  createdAt  |  Timestamp  |

## followers

- userId

|  フィールド名  |  型  |
| ---- | ---- |
|  createdAt  |  Timestamp  |


## posts

- randomId

|  フィールド名  |  型  |
| ---- | ---- |
|  description  |  String  |
|  imageUrls  |  [String]  |
|  likeCount  |  Int  |
|  createdAt  |  Timestamp  |
|  updatedAt  |  Timestamp  |

＊ countの更新についてはCloud Functionsを使用して更新する

## likeUsers

- userId

|  フィールド名  |  型  |
| ---- | ---- |
|  createdAt  |  Timestamp  |


## 参考
https://qiita.com/PictoMki/items/52012bf222de1b0440cc
