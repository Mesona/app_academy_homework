## `users`

| column name      | data type | details                   |
|------------------|-----------|---------------------------|
| id               | integer   | not null, primary key     |
| username         | string    | not null, indexed, unique |
| email            | string    | not null, indexed, unique |
| password_digest  | string    | not null                  |
| session_token    | string    | not null, indexed, unique |
| created_at       | datetime  | not null                  |
| updated_at       | datetime  | not null                  |

## `sites`

| column name     | data type | details                        |
|-----------------|-----------|--------------------------------|
| id              | integer   | not null, primary key          |
| title           | string    | not null                       |
| private         | boolean   | not null, default false        |
| created_at      | datetime  | not null                       |
| updated_at      | datetime  | not null                       |
| owner_id        | integer   | not null, foreign key, indexed |

* `owner_id` references `users`

## `sites_to_invited_users`

| column name | data type | details                        |
|-------------|-----------|--------------------------------|
| id          | integer   | not null, primary key          |
| site_id     | integer   | not null, foreign key, indexed |
| user_id     | integer   | not null, foreign key, indexed |
| created_at  | datetime  | not null                       |
| updated_at  | datetime  | not null                       |

* `user_id` references `users`
* indexed on `[:site_id, :user_id], unique: true`

## `pages`

| column name    | data type | details                        |
|----------------|-----------|--------------------------------|
| id             | integer   | not null, primary key          |
| title          | string    | not null                       |
| body           | text      |                                |
| created_at     | datetime  | not null                       |
| updated_at     | datetime  | not null                       |
| site_id        | integer   | not null, foreign key, indexed |
| parent_page_id | integer   | foreign key                    |

* `site_id` references `sites`
* `parent_page_id` references `pages`

## `posts`

| column name | data type | details                        |
|-------------|-----------|--------------------------------|
| id          | integer   | not null, primary key          |
| title       | string    | not null                       |
| body        | text      | not null                       |
| created_at  | datetime  | not null                       |
| updated_at  | datetime  | not null                       |
| page_id     | integer   | not null, foreign key, indexed |

* `page_id` references `pages`

## `comments`

| column name       | data type | details                        |
|-------------------|-----------|--------------------------------|
| id                | integer   | not null, primary key          |
| body              | text      | not null                       |
| created_at        | datetime  | not null                       |
| updated_at        | datetime  | not null                       |
| post_id           | integer   | not null, foreign key, indexed |
| parent_comment_id | integer   | foreign key                    |

* `post_id` references `posts`
* `parent_comment_id` references `comments`


## `messages`

| column name       | data type | details               |
|-------------------|-----------|-----------------------|
| id                | integer   | not null, primary key |
| body              | text      | not null              |
| created_at        | datetime  | not null              |
| updated_at        | datetime  | not null              |
| sender_id         | integer   | not null, foreign key |
| receiver_id       | interger  | not null, foreign key |
| parent_message_id | integer   | foreign key           |

* `sender_id` references `users`
* `receiver_id` references `users`
* `parent_message_id` references `messages`