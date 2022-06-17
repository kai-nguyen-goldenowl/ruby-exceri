# Scenario

You are making the REST API for next social network application!
To kick things off, your product owner has asked you to begin working on features to allow users to follow other users.
Sounds simple, right? (: Everything is easy with product owner :v)

# User story

1. As a user, I can follow/unfollow other users
2. As a user, I can view my following
3. As a user, I can view my followers
4. As a user, I can view my new followers in current month
5. As a user, I can view top 10 users with most followers

**What Does Following and Followers Mean?**
  - Following refers to the list of users that you follow.
  - Followers are the users that follow you.

# Requirement

1. Database (model) design
    - Table `users` must have these columns: `id`, `username`, `email`, `created_at`, `updated_at`. (Optional: if can please give some validations for `username`, `email` columns)
    - You can add new tables if neccessary
2. Write services to implement above user stories
3. Write test for models + services

Note:
  - You don't need to build completed REST API in this exercise (that mean you can ignore routes & controllers).
  - I have already initialized a rails project in `exercise_2/resolver`, it's included everything you need to start.
