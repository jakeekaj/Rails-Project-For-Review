# Movie Database and Reviews - Rails Assessment

## Features

### Ruby on Rails Associations

  1. belongs_to, has_many, has_many, through:
  2. join table model = Reviews

### Reviews - Join Table model

  1. has content and dynamic rating that updates Movie rating

### Validations

  1. Multiple validations to protect from invalid data and incompete fields

### ActiveRecord scope methods

  1. Class methods to sort and filter according to ranking, rating, and status (unrated)

### Nested Form with a custom attribute writer

  1. User can create movies and reviews at the same page. Reviews being the nested attribute.

### Standard authentication system

  1. Basic Devise authentication system

### Omniauthorization via Facebook

  1. Implemented along with Devise

### Nested resource

  1. Reviews are child resources to Movies, which is the parent resource.

### Validation error displays properly

  1. Field with errors are identified and recognized along with complete error messages.

### DRY Rails app

  1. Makes use of several partials to render various forms.

### Expansion features using jQuery, AJAX, and JSON

  1. Create and load resources without page refresh by using jQuery behind the scenes and getting the data obtained in JSON format, then converting it back to a JavaScript Object to be rendered to the view. 
