# Validations In Controller Actions Lab

Time to apply these new tools!

The goal of this lab is to allow users of this blog-style application to create and edit authors and posts without worrying about typos or other mistakes leading to error-prone form submissions.

For example, if someone creates a blog post with less than 100 characters of content, it's likely that they accidentally pasted the wrong text, or misunderstood which information goes into which field. We can improve the user's experience and the stability of our codebase by notifying users about these kinds of mistakes *before* bad data gets into the database.

# Objectives
- Define validations on a model
- Use the validation state of a model in a response conditional in an action
- Re-render a form with validation errors
- Validate a create action
- Validate an update action

# Requirements
Run `rake db:seed` so you have some data to work with (defined in `db/seeds.rb`).
Barebones app with two models, `Author` and `Post`. 
Right now, you can...
- [View an author](http://localhost:3000/authors/1)
- [View a post](http://localhost:3000/posts/1)
- [Create an author](http://localhost:3000/authors/new)
- [Edit a post](http://localhost:3000/posts/1/edit)

To complete this lab, you will need to:
AUTHOR (MODEL) Add validations
1. `Author` name cannot be blank
2. `Author` e-mail is unique

POST (MODEL) Add validations
1. `Post` title cannot be blank
2. `Post` category is either `"Fiction"` or `"Non-Fiction"`
3. `Post` content is at least 100 characters long.

CONTROLLERS
1. Change `AuthorsController#create` to re-render the form if the new author is invalid.
2. Change `PostsController#update` to re-render the form if the updated post is invalid.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/validations-in-controller-actions-rails-lab' title='Validations In Controller Actions Lab'>Validations In Controller Actions Lab</a> on Learn.co and start learning to code for free.</p>


#LEARN Checklist
AuthorsController
  showing an author: shows an author
  creating a valid author:      creates successfully 
  creating a valid author:      redirects to show page
  creating an invalid author:   does not create (FAILED - 1)
  creating an invalid author:   has an error for missing name (FAILED - 2)
  creating an invalid author:   has an error for non-unique email (FAILED - 3)
  creating an invalid author:   renders the form again (FAILED - 4)

PostsController
  showing a post
    shows a post
  making valid updates
    updates successfully
    redirects to show page
  making invalid updates
    has an error for missing title (FAILED - 5)
    has an error for too short content (FAILED - 6)
    has an error for invalid category (FAILED - 7)
    controller actions
      does not update (FAILED - 8)
      renders the form again (FAILED - 9)



#LEARN Failures:

1) AuthorsController creating an invalid author does not create
     Failure/Error: expect(jeff_bad).to be_new_record
       expected nil to be a new record, but was persisted

2) AuthorsController creating an invalid author has an error for missing name
     Failure/Error: expect(jeff_bad.errors[:name]).to_not be_empty
       expected `[].empty?` to return false, got true

 3) AuthorsController creating an invalid author has an error for non-unique email
     Failure/Error: expect(jeff_bad.errors[:email]).to_not be_empty
       expected `[].empty?` to return false, got true

4) AuthorsController creating an invalid author renders the form again
     Failure/Error: expect(response).to render_template(:new)
       expecting <"new"> but was a redirect to <http://test.host/authors/2>

5) PostsController making invalid updates has an error for missing title
     Failure/Error: let(:article_bad) { Post.create(bad_attributes) }
     
     ActiveRecord::RecordNotUnique:
       SQLite3::ConstraintException: UNIQUE constraint failed: posts.id: INSERT INTO "posts" ("id", "category", "content", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)

6) PostsController making invalid updates has an error for too short content
     Failure/Error: let(:article_bad) { Post.create(bad_attributes) }
     
     ActiveRecord::RecordNotUnique:
       SQLite3::ConstraintException: UNIQUE constraint failed: posts.id: INSERT INTO "posts" ("id", "category", "content", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)

7) PostsController making invalid updates has an error for invalid category
     Failure/Error: let(:article_bad) { Post.create(bad_attributes) }
     
     ActiveRecord::RecordNotUnique:
       SQLite3::ConstraintException: UNIQUE constraint failed: posts.id: INSERT INTO "posts" ("id", "category", "content", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)


8) PostsController making invalid updates controller actions does not update
     Failure/Error: expect(article_found.content).to_not eq("too short")
     
       expected: value != "too short"
            got: "too short"
     
       (compared using ==)

9) PostsController making invalid updates controller actions renders the form again
     Failure/Error: expect(response).to render_template(:edit)
       expecting <"edit"> but was a redirect to <http://test.host/posts/1>