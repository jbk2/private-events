# README

## The Odin Project - private-event project:

**Brief**
- You want to build a site similar to a private Eventbrite which allows users to create events and then manage user signups.
- A user can create events. A user can attend many events. An event can be attended by many users. Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”).
- This project will require you to model many-to-many relationships and also to be very conscious about your foreign keys and class names (hint: you won’t be able to just rely on Rails’ defaults like you have before).

**Learnings**
- Futher Devise authentication practice
- ActiveRecord associations:
  - many to many join tables
  - using m2m join table as its own class & model to store attributes on
  - custom association naming and use of :through, :class, :foreign_key, :source
  - associated model object management
  - ActiveRecord querying
  - db seeds
- Further forms practice
- Furhter best practice MVC pattern code location
- Tailwind integration & utility creation

---
## ToDo list:

- Event#show, enable table to edit and delete events
- event#show view - enable checkbox to update on state change not submit button
- Tidy up views
