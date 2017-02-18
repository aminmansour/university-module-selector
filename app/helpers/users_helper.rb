module UsersHelper
  # Returns the full name for an user.
  def full_name_for(user)
    "#{user.first_name} #{user.last_name}"
  end

  # Returns the string representation of an user's privilege level.
  def privileges_description_for(user)
    case user.user_level
    when 3
      "Student"
    when 2
      "Department Administrator"
    when 1
      "System Administrator"
    end
  end

  # Returns an array containing all departments in a specified faculty
  def departments_of(faculty)
    @depts = Department.pluck(faculty)
  end

  # Returns an array containing all courses in a specified department
  def courses_of(department) 
    @course = Course.pluck(department)
  end

  # Returns the year of study of the current user, or empty if one has not been set
  def year_of_study_for(user)
    "#{user.year_of_study}"
  end

  def faculty_for(user)
    if(user.faculty_id.present?)
      fac = Faculty.find(user.faculty_id)
      "#{fac.name}"
    else
      " "
    end
  end

  def department_for(user)
    if(user.department_id.present?)
      dep = Department.find(user.department_id)
      "#{dep.name}"
    else
      " "
    end
  end

  def course_for(user)
    if(user.course_id.present?)
      cou = Course.find(user.course_id)
      "#{cou.name}"
    else
      " "
    end
  end
end
