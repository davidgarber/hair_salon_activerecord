HAIR SALON
==========

    by

DAVID GARBER
============

REQUIREMENTS
============

Ruby v. 2.2.2 POSTGRES v. 9.4.1

INSTALLATION
============

clone hair_salon_activerecord from github

Open terminal

cd desktop

cd hair_salon_activerecord

$ bundle

$ postgres

$ rake db:create

$ rake db:migrate

$ rake db:test:prepare

$ ruby app.rb

In the browser go to localhost:4567

ABOUT
=====

Hair Salon is a a program where a user can add stylists, clients and clients to
stylists, as well as, update and delete clients and stylists.

COPYRIGHT 2015
==============

LICENSING
=========

Free to students

KNOWN BUGS
==========

Fails specs on updates client and stylist.
