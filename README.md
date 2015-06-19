Acryr
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is open source and supported by subscribers. Please join RailsApps to support development of Rails Composer.

Problems? Issues?
-----------

Need help? Ask on Stack Overflow with the tag 'railsapps.'

Your application contains diagnostics in the README file. Please provide a copy of the README file when reporting any issues.

If the application doesn't work as expected, please [report an issue](https://github.com/RailsApps/rails_apps_composer/issues)
and include the diagnostics.

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.2
- Rails 4.2.1

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).
Project status
---------------
 - Dev : Iteration 0
 - Prod  : Iteration 0

Features to do
---------------
 - Iteration 0
 - Iteration 1
 - Iteration 2
    - , when a claim has been deleted or reviewed

Changelog
---------------
 - Iteration 0
    - Carrierwave support
    - User login
    - User register
    - User roles
    - Userspace
    - Has zero to many issues
    - Integrate claims with users
    - Created evidence model
        - Multipicture upload support
        - Map one to many Claim => evidence
        - Evidence creation are handled in claim controller
    - Scaffold claims (CRUD)
        - Has one user
        - Has one description
        - Has one title
        - Has one client picture evidence
        - Has one or many issue picture evidence
        - Fix bug, user not displaying correctly in claims display
        - Claims tab show only current logged user claims unless he's admin
  - Iteration 1
      - At administrator level :
          - See all claims in Claims/Index
          - Can delete all claims
          - Can edit only his claims
      - Create participation model to link users to claims
      - Add ability to user to join himself to claim(s)
  - Iteration 2
      - Add field state in claims model (enum  draft, published)
          - The default state of a claim is draft
          - Draft claims are visible only for the creator and administrators
          - Creator can change the state of a claim
      - Create claim review model that contain claim_id, type (enum reject, improve) and content
          - Messages are used by administrator when they reject a claim
          - Only administrator can add/edit/delete messages
          - The claim author see all his messages (but not the claim participants)
      - Added a button to enable administrator to ask for modification of a claim
          - Create a message for the claim
          - Change claim state to draft
      - Added mail support
        - Send mail when a claim has been joined by 10 users


Documentation and Support
-------------------------
 - Specs : https://github.com/ranska/infres_2015

Issues
-------------

Contributers
------------
 - https://github.com/yojolo
 - https://github.com/Uwy
 - https://github.com/Nakou
 - https://github.com/CharlesCoque
 - https://github.com/HotBlackHole

Credits
-------
https://github.com/RailsApps/rails_apps_composer
// The usual (rails, ruby etc)

License
-------
The MIT License (MIT)

Copyright (c) 2015 yojolo, Uwy, Nakou, CharlesCoque, HotBlackHole

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
