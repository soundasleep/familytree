familytree
==========

`familytree` is a Ruby on Rails application for managing, displaying and exporting
your personal family tree.

## TODO

Facts can be finegrained and attributed to sources.
A person can have multiple facts.
Sources can have assignable authority levels.

1. Browsable pages per person with hyperlinks
1. Printable book format export of all people
1. Family tree display
1. Family tree generation and display tweaking
1. DOT export
1. YML export
1. GEDCOM export
1. Filters for all pages e.g. focus only on _x_ heirarchy

## Installing

```
bundle install
rake db:setup db:migrate
rails s
```
