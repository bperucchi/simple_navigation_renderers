require "simple-navigation"
require "simple_navigation_renderers/exceptions"
require "simple_navigation_renderers/bootstrap"
require "simple_navigation_renderers/bootstrap_breadcrumb"
require "simple_navigation_renderers/engine" if defined? Rails::Engine
require "simple_navigation_renderers/version"

module SimpleNavigationRenderers
end

SimpleNavigation.register_renderer( bootstrap2: SimpleNavigationRenderers::Bootstrap2 )
SimpleNavigation.register_renderer( bootstrap3: SimpleNavigationRenderers::Bootstrap3 )
SimpleNavigation.register_renderer( breadcrumb3: SimpleNavigationRenderers::BootstrapBreadcrumbs )