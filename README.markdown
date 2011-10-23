[![image](https://secure.travis-ci.org/lucapette/checkboxes.png)](http://travis-ci.org/lucapette/checkboxes)

Introduction
------------

This gem will help you to handle has\_many :through associations when
you need to add/remove these ones with checkboxes. If you think about
this type of situation you do the same steps for each association you
have to handle with checkboxes. I exctracted this gem from a project
where I had to handle about ten associations with checkboxes.

How to use it
-------------

The best way to describe checkboxes is to show some code:

In your model:

    class User < ActiveRecord::Base
        has_many :groups,:through=>:user_groups
        has_many :user_groups
        # add your associations
        checkboxes_for :groups
    end

    class Group < ActiveRecord::Base
        attr_accessible :name

        def to_s
            name
        end
    end

    class UserGroup < ActiveRecord::Base
      belongs_to :user
      belongs_to :group
    end

In your view:

    <%= form_for @user do |f| %>
      <%= f.error_messages %>
      <%= f.checkboxes_for :groups  %>
      </p>
      <p><%= f.submit %></p>
    <% end %>

and that's all. Now, when you submit your form you get the has\_many :through association updated.

Roadmap
-------

-   improve documentation
-   write options for helper
-   write more helpers


Copyright
---------

Copyright 2011 Luca Pette

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
