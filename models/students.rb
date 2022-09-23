class People
  # @@all_people = []
  # def initialize(**arg)
  #   @@all_people.push(self)
  #   @name = arg[:name]
  # end
  # def self.all
  #   @@all_people
  # end

  def self.return_logins_counts(logins, people)
    # Handle here real keys
    logins.transform_keys! { |key| find_people(key, people) }

    # append counts per name
    student_format = {}
    logins.each do |key, value|
      handle_user(key, value, student_format)
    end
    p student_format
  end

  def self.handle_user(key, value, student_format)
    student_format[key] = value.map(&:year).group_by { |key| key }.transform_values! { |values| values.count }
  end

  def self.find_people(id, people)
    people.find do |student|
      student.include?(id)
    end.last
  end

end