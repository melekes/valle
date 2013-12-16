## 0.2.3 / 2013-12-16

* fixes issue #12 with breaking rake db:migrate:reset [Marcus Geißler]

## 0.2.2 / 2013-11-28

* fix relation does not exist error (fixes #10) [qblake]

## 0.2.1 / 2013-11-27

* fixed uninitialized constant AR::SchemaMigration [Anton Kalyaev]
* added limits for 6 byte integer [Anton Kalyaev]

## 0.2.0 / 2013-11-16

* added attributes option [Anton Kalyaev]

## 0.1.0 / 2013-11-08

* fixed Stack too deep error [Anton Kalyaev]
* enabled option now works [Anton Kalyaev]
* fixed db:migrate error [Anton Kalyaev]
* dot not override AR#valid? method [Anton Kalyaev]

## 0.0.3 / 2012-12-13

* added primary_key type [Anton Kalyaev]
* added missing argument to respond_to? [Anton Kalyaev]
* config is now working [Anton Kalyaev]

## 0.0.2 / 2012-12-11

* fixed inherited behavior; switched to valid? method (Fixes #3) [Anton Kalyaev]
* added support for integer columns [Anton Kalyaev]
* added 3 types of columns: character_limited, byte_limited and unlimited [Anton Kalyaev]
* removed engine [Anton Kalyaev]
* fix typos in README.md [Aleksandr Ivanov]

## 0.0.1 / 2012-12-09

* Initial release (with basic strings support)
