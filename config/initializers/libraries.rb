# WTF Require these gems manually because Bundler doesn't seem to:
require 'google_chart'

# Facets (only load the subset that's used)
require 'facets/dictionary'
require 'facets/enumerable/mash'
require 'facets/file/write'
require 'facets/kernel/ergo'
require 'facets/kernel/with'
require 'facets/boolean'

# Local libraries
require 'lib/defer_proxy'
require 'lib/rwikibot_page_drone'
require 'lib/ext/active_support_cache_object'
require 'lib/ext/object_logit'
require 'lib/ext/active_record_quoting_fix'
require 'lib/ext/time_today'
require 'lib/ext/string_possessiveize'
require 'lib/ext/vpim_icalendar_extra_properties'
