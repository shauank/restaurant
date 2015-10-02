ActiveSupport.on_load :active_record do
  include ArelHelpers::ArelTable
end