require "sub_seek_ql/version"

module SubSeekQl
  # class Error < StandardError; end
  
  def last_n_records_by_association(association_column_name, limit = 1)

    # TODO: Need to pull in a better way to pluralize class names. Initial thought is to pull in ActiveSupport and use it's pluralize helper,
    # though maybe it's too much to pull in just for that code at the moment? Maybe just yank the pluralize method itself for now?
    self.find_by_sql("SELECT * FROM #{(self.to_s + "s").downcase} AS p1 WHERE p1.id IN (SELECT id FROM #{(self.to_s + "s").downcase} AS p2 WHERE p2.#{association_column_name} = p1.#{association_column_name} LIMIT #{limit.to_s}) ORDER BY p1.created_at DESC")
  end
end
