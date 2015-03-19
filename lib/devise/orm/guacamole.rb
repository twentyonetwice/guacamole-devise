require 'devise'
require 'guacamole/model/orm_adapter'
require 'guacamole/devise/railtie' if defined? Rails

Guacamole::Model::ClassMethods.send :include, Devise::Models
