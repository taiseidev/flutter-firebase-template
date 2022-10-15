# flutter_firebase_template

flutter✖︎firebaseのサンプルをまとめたプロジェクト

## Chat機能

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

## likeUsers

- userId

|  フィールド名  |  型  |
| ---- | ---- |
|  createdAt  |  Timestamp  |
